//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct EventViewModel {
    var datas = Variable<[String]>([])
    
    init() {
        for i in 1...5 {
            datas.value.append(String(i))
        }
    }
    
    func selectAtIndex(i: Int) {
        datas.value.append("a")
    }
    
    func updateDatas() {
        print("yoni")
    }
}
