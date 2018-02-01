//
//  EventViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Koyomi
import SVGKit

class TaskViewController: CalendarViewController, UITableViewDelegate {
    let viewModel = TaskViewModel()
    let disposeBag   = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(TaskViewController.refresh(sender:)), for: .valueChanged)
        tableView.delegate = self
    }
    
    func bindViewAndViewModel() {
        viewModel.datas.asObservable()
            .subscribe({ event in
                if event.event.element?.count == 0 {
                    self.tableView.backgroundView = self.setEmptyStateView()
                }else {
                    self.tableView.backgroundView = nil
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.datas.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { (row, element, cell) in
                (cell.viewWithTag(1) as! UILabel).text = element.eventTitle
                (cell.viewWithTag(2) as! UILabel).text = "開始時 " + element.startDateTime!
                (cell.viewWithTag(3) as! UILabel).text = "終了時 " + element.deadline!
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.selectAtIndex(i: indexPath.row)
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        NotificationCenter.default.rx.notification(Notification.Name("fetchTaskNotifi"), object: nil)
            .subscribe({ _ in
                self.viewModel.updateDatas(date: self.selectedDateStr)
            })
            .disposed(by: disposeBag)
    }
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        selectedDate = date!
        self.isNavTapped = false
        view.viewWithTag(256)?.removeFromSuperview()
        viewModel.updateDatas(date: selectedDateStr)
    }
    
    func setEmptyStateView() -> UIView {
        let emptyStateView = UIView()
        emptyStateView.frame = CGRect(x: self.tableView.bounds.width / 4, y: self.tableView.bounds.width / 2, width: self.tableView.bounds.width / 2, height: self.tableView.bounds.width / 2)
        emptyStateView.backgroundColor = UIColor.gray
        let eventImageView = UIImageView(frame: emptyStateView.frame)
        eventImageView.image = R.image.event()
        let svgImage = SVGKImage(named: "taskVec")
        svgImage?.size = emptyStateView.bounds.size
        eventImageView.image = svgImage?.uiImage
        emptyStateView.addSubview(eventImageView)
        return emptyStateView
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        viewModel.updateDatas(date: selectedDateStr)
        sender.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let destructiveAction = UIContextualAction(style: .destructive,title: "Delete") { (action, view, completionHandler) in
            self.viewModel.deleteTask(id: self.viewModel.datas.value[indexPath.row].id!)
            completionHandler(true)
        }
        let detailAction = UIContextualAction(style: .normal,title: "Detail") { (action, view, completionHandler) in
            self.performSegue(withIdentifier: "toEditTask",sender: indexPath.row)
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [destructiveAction, detailAction])
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEditTask") {
            let vc: EditTaskViewController = (segue.destination as? EditTaskViewController)!
            let data = self.viewModel.datas.value[sender as! Int]
            vc.data = data
        }
    }
}
