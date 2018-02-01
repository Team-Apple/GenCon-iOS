//
//  EditViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/02.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Material

class NewAnnounceViewController: UIViewController {
    @IBOutlet weak var timing: UIPickerView!
    @IBOutlet weak var mode: UIPickerView!

    var viewModel = NewTaskViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
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

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true,completion: nil)
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        viewModel.saveEvent()
        self.dismiss(animated: true,completion: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view = nil
        NotificationCenter.default.post(name: Notification.Name("fetchAnnounceNotifi"), object: nil, userInfo: nil)
    }

}
