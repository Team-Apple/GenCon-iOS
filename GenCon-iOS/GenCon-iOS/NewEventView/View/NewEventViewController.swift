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

class NewEventViewController: UIViewController {
    @IBOutlet weak var eventTitle: TextField!
    @IBOutlet weak var memo: TextField!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var viewModel = NewEventViewModel()
    var disposeBag = DisposeBag()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        bindViewAndViewModel()
    }

    func bindViewAndViewModel() {
        eventTitle.rx.text.orEmpty.bind(to: viewModel.title).disposed(by: disposeBag)
        memo.rx.text.orEmpty.bind(to: viewModel.memo).disposed(by: disposeBag)
        
        Observable.combineLatest(eventTitle.rx.text.orEmpty.asObservable(), memo.rx.text.orEmpty.asObservable()){
                $0.characters.count > 0 && $1.characters.count > 0
            }
            .bind(to: saveButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        
        startDate.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.startDate = self.dateFormatter.string(from: date)
            })
            .disposed(by: disposeBag)

        endDate.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.endDate = self.dateFormatter.string(from: date)
            })
            .disposed(by: disposeBag)
        
        dateFormatter.dateFormat = "HH:mm"
        
        startTime.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.startTime = self.dateFormatter.string(from: date)
            })
            .disposed(by: disposeBag)
        
        endTime.rx.date.asObservable()
            .bind(onNext: { date in
                self.viewModel.endTime = self.dateFormatter.string(from: date)
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
}
