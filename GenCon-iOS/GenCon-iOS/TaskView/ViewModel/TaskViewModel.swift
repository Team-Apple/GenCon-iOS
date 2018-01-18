//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct TaskViewModel {
    let datas = Variable<[TaskObject]>([])
    let request = Requests()
    
    init() {
        updateDatas(date: DateUtils.stringFromDate(date: Date(), format: "yyyy-MM-dd"))
    }
    
    func selectAtIndex(i: Int) {
        //datas.value.append("a")
    }
    
    func updateDatas(date: String) {
        request.fetchTasks(startDate: date.replacingOccurrences(of: "/", with: "-")) { (data: [TaskObject]) in
            self.datas.value.removeAll()
            self.datas.value = data
        }
    }
    
    func deleteTask(id: String) {
        request.deleteTask(id: id)
    }
}
