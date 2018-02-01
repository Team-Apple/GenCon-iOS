//
//  EventObject.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/30.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class EventObject: NSObject, Mappable, NSCoding {
    var eventTitle:     String?
    var startDateTime:  String?
    var endDateTime:    String?
    var memo:           String?
    var priority:       String?
    var id:             String?
    var isNotifi = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        eventTitle      <- map["title"]
        startDateTime   <- map["start_at"]
        endDateTime     <- map["end_at"]
        memo            <- map["memo"]
        priority        <- map["priority"]
        id              <- map["id"]
    }
    
    required init?(coder aDecoder: NSCoder) {
        eventTitle = aDecoder.decodeObject(forKey: "eventTitle") as? String
        startDateTime = aDecoder.decodeObject(forKey: "startDateTime") as? String
        endDateTime = aDecoder.decodeObject(forKey: "endDateTime") as? String
        memo = aDecoder.decodeObject(forKey: "memo") as? String
        priority = aDecoder.decodeObject(forKey: "priority") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        isNotifi = aDecoder.decodeObject(forKey: "isNotifi") as! Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(eventTitle, forKey: "eventTitle")
        aCoder.encode(startDateTime, forKey: "startDateTime")
        aCoder.encode(endDateTime, forKey: "endDateTime")
        aCoder.encode(memo, forKey: "memo")
        aCoder.encode(priority, forKey: "priority")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(isNotifi, forKey: "isNotifi")
    }
}
