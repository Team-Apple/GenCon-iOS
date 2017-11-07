//
//  EditViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import Material
import RxSwift
import RxCocoa

class EditEventViewController: UIViewController {
    @IBOutlet weak var eventTitle: TextField!
    @IBOutlet weak var memo: TextField!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var data: EventObject? = nil
    var viewModel = EditEventViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        bindViewAndViewModel()
    }
    
    func setValue() {
        eventTitle.text = data?.eventTitle
        memo.text = data?.memo
        startDate.date = DateUtils.dateFromString(string: (data?.startDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        startTime.date = DateUtils.dateFromString(string: (data?.startDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        endDate.date = DateUtils.dateFromString(string: (data?.endDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        endTime.date = DateUtils.dateFromString(string: (data?.endDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
    }
    
    func bindViewAndViewModel() {
        eventTitle.rx.text.orEmpty.bind(to: viewModel.title).disposed(by: disposeBag)
        memo.rx.text.orEmpty.bind(to: viewModel.memo).disposed(by: disposeBag)
        
        Observable.combineLatest(eventTitle.rx.text.orEmpty.asObservable(), memo.rx.text.orEmpty.asObservable()){
            $0.count > 0 && $1.count > 0
            }
            .bind(to: saveButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        startDate.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.startDate = DateUtils.stringFromDate(date: date, format: "yyyy-MM-dd")
            })
            .disposed(by: disposeBag)
        
        endDate.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.endDate = DateUtils.stringFromDate(date: date, format: "yyyy-MM-dd")
            })
            .disposed(by: disposeBag)
        
        startTime.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.startTime = DateUtils.stringFromDate(date: date, format: "HH:mm")
            })
            .disposed(by: disposeBag)
        
        endTime.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.endTime = DateUtils.stringFromDate(date: date, format: "HH:mm")
            })
            .disposed(by: disposeBag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view = nil
    }
    
    @IBAction func update(_ sender: UIBarButtonItem) {
        viewModel.updateEvent(id: (data?.id)!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
