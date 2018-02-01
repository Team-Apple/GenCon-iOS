//
//  taskObject.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/12/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class TaskObject: Mappable {
    var eventTitle:     String?
    var startDateTime:  String?
    var deadline:    String?
    var memo:           String?
    var priority:       String?
    var id:             String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        eventTitle      <- map["title"]
        startDateTime   <- map["start_from"]
        deadline     <- map["deadline"]
        memo            <- map["memo"]
        priority        <- map["priority"]
        id              <- map["id"]
    }
}
