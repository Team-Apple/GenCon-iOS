//
//  NewEventModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/03.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct NewEventViewModel {
    var title = Variable("")
    var memo = Variable("")
    var priority: String? = "1"
    var startDate: String?
    var startTime: String?
    var endDate: String?
    var endTime: String?
    let request = Requests()
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        startDate = dateFormatter.string(from: Date())
        endDate = dateFormatter.string(from: Date())
        dateFormatter.dateFormat = "HH:mm"
        startTime = dateFormatter.string(from: Date())
        endTime = dateFormatter.string(from: Date())
    }
    
    func saveEvent() {
        print("\(title.value)\n\(memo.value)")
    }
}
