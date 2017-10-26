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
    var isNavTapped = false
    var selectedDateStr = "" {
        didSet {
            titleLabel.text = selectedDateStr
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
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexStr: "#009688", alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        titleLabel.text = selectedDateStr
        titleLabel.textColor = UIColor.hex(hexStr: "#ffffff", alpha: 1.0)
        titleLabel.sizeToFit()
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalendarViewController.tapped)))
        titleLabel.isUserInteractionEnabled = true
        self.navigationItem.titleView = titleLabel
        
        koyomi.selectionMode = .single(style: .background)
        koyomi.tag = 1
        koyomi.dayBackgrondColor = UIColor.hex(hexStr: "009688", alpha: 1.0)
        koyomi.weekBackgrondColor = UIColor.hex(hexStr: "009688", alpha: 1.0)
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
            view.viewWithTag(1)?.removeFromSuperview()
        }else {
            view.addSubview(koyomi)
            isNavTapped = true
            
            let date_formatter: DateFormatter = DateFormatter()
            date_formatter.locale     = Locale(identifier: "ja")
            date_formatter.dateFormat = "yyyy/MM/dd"
        }
    }
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        selectedDate = date!
        isNavTapped = false
        view.viewWithTag(1)?.removeFromSuperview()
    }
}
