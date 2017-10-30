//
//  EventViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

/*
 selectedDate is variable of CalendarViewController
*/

import UIKit
import RxSwift
import RxCocoa
import RxBlocking
import Koyomi

class EventViewController: CalendarViewController, UITableViewDelegate {
    let viewModel = EventViewModel()
    let disposeBag   = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndModel()
    }
    
    func bindViewAndModel() {
        viewModel.datas.asObservable()
            .subscribe({ event in
                if event.event.element?.count == 0 {
                    self.tableView.backgroundView = self.setEmptyStateLabel()
                }else {
                    self.tableView.backgroundView = nil
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.datas.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { (row, element, cell) in
                (cell.viewWithTag(1) as! UILabel).text = element.eventTitle
                (cell.viewWithTag(2) as! UILabel).text = element.startTime
                (cell.viewWithTag(3) as! UILabel).text = element.endTime
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.selectAtIndex(i: indexPath.row)
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        selectedDate = date!
        self.isNavTapped = false
        view.viewWithTag(256)?.removeFromSuperview()
        viewModel.updateDatas(date: selectedDateStr)
    }
    
    func setEmptyStateLabel() -> UILabel {
        let emptyStateLabel = UILabel()
        emptyStateLabel.frame = CGRect(x: 100, y: 100,width: 100, height: self.tableView.bounds.height)
        emptyStateLabel.backgroundColor = UIColor.gray
        emptyStateLabel.textAlignment = NSTextAlignment.center
        emptyStateLabel.text = "No Data"
        emptyStateLabel.textColor = UIColor.white
        emptyStateLabel.adjustsFontSizeToFitWidth = true
        emptyStateLabel.font = UIFont.systemFont(ofSize: 32)
        
        return emptyStateLabel
    }
    
}