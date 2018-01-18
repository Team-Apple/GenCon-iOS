//
//  EditTaskViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2018/01/18.
//  Copyright © 2018年 Taillook. All rights reserved.
//

import RxSwift

struct EditTaskViewModel {
    var title = Variable("")
    var memo = Variable("")
    var priority: String? = "1"
    var startDate: String?
    var startTime: String?
    var endDate: String?
    var endTime: String?
    let request = Requests()
    
    init() {
        startDate = DateUtils.stringFromDate(date: Date(), format: "yyyy-MM-dd")
        endDate = DateUtils.stringFromDate(date: Date(), format: "yyyy-MM-dd")
        startTime = DateUtils.stringFromDate(date: Date(), format: "HH:mm")
        endTime = DateUtils.stringFromDate(date: Date(), format: "HH:mm")
    }
    
    func updateEvent(id: String) {
        request.update(params: ["title": title.value, "start_from_date": startDate!, "start_from_time": startTime!, "deadline_date": endDate!, "deadline_time": endTime!, "memo": memo.value, "priority": "normal"], model: "tasks", id: id)
        print(id)
    }
}


