//
//  NewEventModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/03.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct NewAnnounceViewModel {
    var timing = Variable<Bool>(true)
    var mode = Variable<String>("weather")
    
    let request = Requests()
    
    init() {
    }
    
    func saveEvent() {
        request.saveAnnounce(params: ["mode": mode.value, "timing": timing.value])
    }
}
