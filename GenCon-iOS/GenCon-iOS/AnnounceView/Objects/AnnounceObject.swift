//
//  taskObject.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/12/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import ObjectMapper

class AnnounceObject: Mappable {
    var date:     String?
    var timing:  Bool? {
        didSet {
            if timing! {
                timingStr = "家を出るとき"
            } else {
                timingStr = "家に帰ったとき"
            }
        }
    }
    var timingStr = ""
    var mode:    String? {
        didSet {
            if mode != nil {
                switch mode! {
                case "weather":
                    mode = "天気"
                    modeIcon = "weather"
                    modeColor = "#ff9800"
                case "trash":
                    mode = "ゴミ出し"
                    modeIcon = "trash"
                    modeColor = "#f44336"
                case "exchange":
                    mode = "為替"
                    modeIcon = "exchange"
                    modeColor = "#ffeb3b"
                default:
                    mode = ""
                }
            }
        }
    }
    var modeIcon: String = "weather"
    var modeColor: String = "#f44336"
    var id:      String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        date        <- map["date"]
        timing      <- map["timing"]
        mode        <- map["mode"]
        id          <- map["id"]
    }
}
