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
            .bind(to: tableView.rx.items(cellIdentifier:"Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel!.text = element
                //(cell.viewWithTag(1) as! UILabel).text = user.name!
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
        print(String(describing: date!))
        selectedDate = date!
        viewModel.updateDatas()
    }
}
