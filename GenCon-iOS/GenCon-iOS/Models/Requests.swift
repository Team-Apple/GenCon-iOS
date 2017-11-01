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
    let baseURL = "https://gencon-web.herokuapp.com/"
    
    func fetchEvents(callback: @escaping ([EventObject]) -> Void) {
        Alamofire.request(baseURL + "events.json", method: .get, parameters: nil).validate().responseJSON{ response in
            var data: [EventObject] = []
            
            //print(response.result.value as! [[String: Any]])
            
            for item in (response.result.value as! [[String: Any]]) {
                print(item)
                let eventObject: EventObject = Mapper<EventObject>()
                    .map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: item, options: []), encoding: .utf8)!)!
                data.append(eventObject)
            }
            callback(data)
        }
    }
    
}
