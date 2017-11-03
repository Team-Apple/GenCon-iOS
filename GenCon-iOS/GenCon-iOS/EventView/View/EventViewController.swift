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
import Koyomi

class EventViewController: CalendarViewController, UITableViewDelegate {
    let viewModel = EventViewModel()
    let disposeBag   = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(EventViewController.refresh(sender:)), for: .valueChanged)
        tableView.delegate = self
    }
    
    func bindViewAndViewModel() {
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
                (cell.viewWithTag(2) as! UILabel).text = "開始時 " + element.startDateTime!
                (cell.viewWithTag(3) as! UILabel).text = "終了時 " + element.endDateTime!
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
    
    @objc func refresh(sender: UIRefreshControl) {
        viewModel.updateDatas(date: selectedDateStr)
        sender.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let destructiveAction = UIContextualAction(style: .destructive,title: "Delete") { (action, view, completionHandler) in
            completionHandler(true)
        }
        let detailAction = UIContextualAction(style: .normal,title: "Detail") { (action, view, completionHandler) in
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [destructiveAction, detailAction])
        return configuration
    }
    
}
