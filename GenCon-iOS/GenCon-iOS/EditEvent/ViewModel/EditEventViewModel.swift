//
//  EditViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct EditEventViewModel {
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
        request.update(params: ["title": title.value, "start_at_date": startDate!, "start_at_time": startTime!, "end_at_date": endDate!, "end_at_time": endTime!, "memo": memo.value, "priority": "normal"], model: "events", id: id)
        print(id)
    }
}

