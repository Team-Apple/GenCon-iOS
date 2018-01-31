//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct AnnounceViewModel {
    let datas = Variable<[AnnounceObject]>([])
    let request = Requests()
    
    init() {
    }
    
    func selectAtIndex(i: Int) {
        //datas.value.append("a")
    }
    
    func updateDatas() {
        request.fetchAnnounce() { (data: [AnnounceObject]) in
            self.datas.value.removeAll()
            self.datas.value = data
        }
    }
    
    func deleteTask(id: String) {
        request.deleteTask(id: id)
    }
}
