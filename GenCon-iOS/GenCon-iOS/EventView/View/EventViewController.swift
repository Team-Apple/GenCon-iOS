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
                    let emptyStateLabel = UILabel()
                    emptyStateLabel.frame = CGRect(x: 100, y: 100,width: 100, height: self.tableView.bounds.height)
                    emptyStateLabel.backgroundColor = UIColor.gray
                    emptyStateLabel.textAlignment = NSTextAlignment.center
                    emptyStateLabel.text = "No Data"
                    emptyStateLabel.textColor = UIColor.white
                    emptyStateLabel.adjustsFontSizeToFitWidth = true
                    emptyStateLabel.font = UIFont.systemFont(ofSize: 32)
                    self.tableView.backgroundView = emptyStateLabel
                }else {
                    self.tableView.backgroundView = nil
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.datas.asObservable()
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                (cell.viewWithTag(1) as! UILabel).text = "焼肉ランチ"
                (cell.viewWithTag(2) as! UILabel).text = "開始時刻: " + "n時m分"
                (cell.viewWithTag(3) as! UILabel).text = "終了時刻: " + "n時m分"
                return cell
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
}
