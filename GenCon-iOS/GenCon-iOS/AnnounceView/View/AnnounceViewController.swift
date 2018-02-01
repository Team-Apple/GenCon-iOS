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

class AnnounceViewController: UIViewController ,UITableViewDelegate {
    let viewModel = AnnounceViewModel()
    let disposeBag   = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateDatas()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(AnnounceViewController.refresh(sender:)), for: .valueChanged)
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
                (cell.viewWithTag(1) as! UILabel).text = element.mode!
                (cell.viewWithTag(2) as! UILabel).text = element.timingStr
                (cell.viewWithTag(3) as! UIImageView).image = UIImage(named: element.modeIcon)
                (cell.viewWithTag(4))?.backgroundColor = UIColor.hex(hexStr: element.modeColor, alpha: 1)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.selectAtIndex(i: indexPath.row)
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func setEmptyStateView() -> UIView {
        let emptyStateView = UIView()
        emptyStateView.frame = CGRect(x: self.tableView.bounds.width / 4, y: self.tableView.bounds.width / 2, width: self.tableView.bounds.width / 2, height: self.tableView.bounds.width / 2)
        emptyStateView.backgroundColor = UIColor.gray
        let eventImageView = UIImageView(frame: emptyStateView.frame)
        eventImageView.image = R.image.event()
        let svgImage = SVGKImage(named: "annoVec")
        svgImage?.size = emptyStateView.bounds.size
        eventImageView.image = svgImage?.uiImage
        emptyStateView.addSubview(eventImageView)
        return emptyStateView
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        viewModel.updateDatas()
        sender.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let destructiveAction = UIContextualAction(style: .destructive,title: "Delete") { (action, view, completionHandler) in
            self.viewModel.deleteAnnounce(id: self.viewModel.datas.value[indexPath.row].id!)
            completionHandler(true)
        }
        /*let detailAction = UIContextualAction(style: .normal,title: "Detail") { (action, view, completionHandler) in
            self.performSegue(withIdentifier: "toEditTask",sender: indexPath.row)
            completionHandler(true)
        }*/
        let configuration = UISwipeActionsConfiguration(actions: [destructiveAction])
        return configuration
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEditTask") {
            let vc: EditTaskViewController = (segue.destination as? EditTaskViewController)!
            let data = self.viewModel.datas.value[sender as! Int]
            vc.data = data
        }
    }*/
}
