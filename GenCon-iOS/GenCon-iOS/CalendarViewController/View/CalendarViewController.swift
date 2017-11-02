//
//  ViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/05.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import Koyomi

class CalendarViewController: UIViewController, KoyomiDelegate {
    var isNavTapped = false {
        didSet {
            isNavTapped ? (titleLabel.text = selectedDateStr + "▲") : (titleLabel.text = selectedDateStr + "▼")
            titleLabel.sizeToFit()
        }
    }
    var selectedDateStr = "" {
        didSet {
            titleLabel.text = selectedDateStr + "▲"
            titleLabel.sizeToFit()
        }
    }
    var selectedDate = Date() {
        didSet {
            dateFormatter.locale = Locale(identifier: "ja_JP")
            dateFormatter.dateFormat = "yyyy/MM/dd"
            selectedDateStr = dateFormatter.string(from: selectedDate)
        }
    }
    let dateFormatter = DateFormatter()
    let titleLabel = UILabel()
    let koyomi = Koyomi(frame: CGRect(x: 0, y : 0, width: DeviceSize.screenWidth, height: 300), sectionSpace: 1.5, cellSpace: 0.5, inset: .zero, weekCellHeight: 25)

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDate = Date()
        setUI()
    }

    func setUI() {
        titleLabel.text = selectedDateStr + "▼"
        titleLabel.textColor = UIColor.white
        titleLabel.sizeToFit()
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalendarViewController.tapped)))
        titleLabel.isUserInteractionEnabled = true
        self.navigationItem.titleView = titleLabel
        
        koyomi.selectionMode = .single(style: .background)
        koyomi.tag = 256
        koyomi.dayBackgrondColor = UIColor.main
        koyomi.weekBackgrondColor = UIColor.main
        koyomi.calendarDelegate = self
        koyomi.select(date: Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func tapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if isNavTapped {
            isNavTapped = false
            view.viewWithTag(256)?.removeFromSuperview()
        }else {
            view.addSubview(koyomi)
            isNavTapped = true
        }
    }
}
