//
//  EventObject.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/30.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class EventObject: Mappable {
    var eventTitle: String?
    var startDate:  String?
    var startTime:  String?
    var endDate:    String?
    var endTime:    String?
    var memo:       String?
    var priority:   String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        eventTitle  <- map["title"]
        startDate   <- map["start_at_date"]
        startTime   <- map["start_at_time"]
        endDate     <- map["end_at_date"]
        endTime     <- map["end_at_time"]
        memo        <- map["memo"]
        priority    <- map["priority"]
    }
}
