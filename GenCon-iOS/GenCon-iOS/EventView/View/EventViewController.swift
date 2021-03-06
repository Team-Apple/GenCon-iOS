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
import SVGKit

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
                (cell.viewWithTag(3) as! UILabel).text = "終了時 " + element.endDateTime!
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.selectAtIndex(i: indexPath.row)
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)

        NotificationCenter.default.rx.notification(Notification.Name("fetchEventNotifi"), object: nil)
            .subscribe({ _ in
                self.viewModel.updateDatas(fetchDate: self.selectedDateStr)
            })
            .disposed(by: disposeBag)
    }
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        selectedDate = date!
        self.isNavTapped = false
        view.viewWithTag(256)?.removeFromSuperview()
        viewModel.updateDatas(fetchDate: selectedDateStr)
    }
    
    func setEmptyStateView() -> UIView {
        let emptyStateView = UIView()
        emptyStateView.frame = CGRect(x: self.tableView.bounds.width / 4, y: self.tableView.bounds.width / 2, width: self.tableView.bounds.width / 2, height: self.tableView.bounds.width / 2)
        emptyStateView.backgroundColor = UIColor.gray
        let eventImageView = UIImageView(frame: emptyStateView.frame)
        eventImageView.image = R.image.event()
        let svgImage = SVGKImage(named: "eventVec")
        svgImage?.size = emptyStateView.bounds.size
        eventImageView.image = svgImage?.uiImage
        emptyStateView.addSubview(eventImageView)
        return emptyStateView
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        viewModel.updateDatas(fetchDate: selectedDateStr)
        sender.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let destructiveAction = UIContextualAction(style: .destructive,title: "Delete") { (action, view, completionHandler) in
            self.viewModel.deleteEvent(id: self.viewModel.datas.value[indexPath.row].id!)
            completionHandler(true)
        }
        let detailAction = UIContextualAction(style: .normal,title: "Detail") { (action, view, completionHandler) in
            self.performSegue(withIdentifier: "toEditEvent",sender: indexPath.row)
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [destructiveAction, detailAction])
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEditEvent") {
            let vc: EditEventViewController = (segue.destination as? EditEventViewController)!
            let data = self.viewModel.datas.value[sender as! Int]
            vc.data = data
        }
    }
    
}
