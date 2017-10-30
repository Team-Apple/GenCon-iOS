//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift
import ObjectMapper

struct EventViewModel {
    var datas = Variable<[EventObject]>([])
    
    init() {
    }
    
    func selectAtIndex(i: Int) {
        //datas.value.append("a")
    }
    
    func updateDatas(date: String) {
        Requests().fetchEvents { (json: [[String: String]]) in
            self.datas.value.removeAll()
            for item in json {
                print(item)
                let eventObject: EventObject = Mapper<EventObject>().map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: item, options: []), encoding: .utf8)!)!
                self.datas.value.append(eventObject)
            }
        }
    }
}
