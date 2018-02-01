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

    var viewModel = NewAnnounceViewModel()
    var disposeBag = DisposeBag()
    var timingList = ["家を出るとき","家に帰ったとき"]
    var modeList = ["天気","ゴミ出し","為替"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewAndViewModel()
    }

    func bindViewAndViewModel() {
        Observable.just(timingList)
            .bind(to: timing.rx.itemTitles) { _, item in
                return item
            }
            .disposed(by: disposeBag)
        timing.rx.modelSelected(String.self)
            .subscribe(onNext: { modal in
                if modal[0] == "家を出るとき" {
                    self.viewModel.timing.value = true
                } else {
                    self.viewModel.timing.value = false
                }
            })
            .disposed(by: disposeBag)
        Observable.just(modeList)
            .bind(to: mode.rx.itemTitles) { _, item in
                return item
            }
            .disposed(by: disposeBag)
        mode.rx.modelSelected(String.self)
            .subscribe(onNext: { modal in
                switch modal[0] {
                case "天気":
                    self.viewModel.mode.value = "weather"
                case "ゴミ出し":
                    self.viewModel.mode.value = "trash"
                case "為替":
                    self.viewModel.mode.value = "exchange"
                default:
                    self.viewModel.mode.value = ""
                }
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
