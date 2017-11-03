//
//  EditViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import Material

class EditEventViewController: UIViewController {
    @IBOutlet weak var eventTitle: TextField!
    @IBOutlet weak var memo: TextField!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var data: EventObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
    }
    
    func setValue() {
        eventTitle.text = data?.eventTitle
        memo.text = data?.memo
        startDate.date = DateUtils.dateFromString(string: (data?.startDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        startTime.date = DateUtils.dateFromString(string: (data?.startDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        endDate.date = DateUtils.dateFromString(string: (data?.endDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
        endTime.date = DateUtils.dateFromString(string: (data?.endDateTime)!, format: "yyyy-MM-dd HH:mm:ss")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view = nil
    }
    
}
