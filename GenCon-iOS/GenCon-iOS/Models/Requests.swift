//
//  Requests.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/30.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import Alamofire
import ObjectMapper

class Requests {
    let baseURL = ""
    
    func fetchEvents(callback: @escaping ([[String: String]]) -> Void) {
        Alamofire.request("http://grapebread.net/testevent/event", method: .get, parameters: nil).validate().responseJSON{ response in
            callback((response.result.value as! [[String: String]]))
        }
    }
    
}
