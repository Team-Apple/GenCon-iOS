//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct EventViewModel {
    let datas = Variable<[EventObject]>([])
    let request = Requests()
    
    init() {
        updateDatas(date: "test")
    }
    
    func selectAtIndex(i: Int) {
        //datas.value.append("a")
    }
    
    func updateDatas(date: String) {
        request.fetchEvents { (data: [EventObject]) in
            self.datas.value.removeAll()
            self.datas.value = data
        }
    }
}
