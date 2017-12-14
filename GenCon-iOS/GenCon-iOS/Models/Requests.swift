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
    let baseURL = "https://gencon-web.herokuapp.com/api/"
    
    func fetchEvents(startDate: String, callback: @escaping ([EventObject]) -> Void) {
        Alamofire.request(baseURL + "events.json", method: .get, parameters: ["start_at_date": startDate])
            .responseJSON{ response in
            if response.response?.statusCode == 200 {
                var data: [EventObject] = []
                for item in (response.result.value as! [[String: Any]]) {
                    let eventObject: EventObject = Mapper<EventObject>()
                        .map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: item, options: []), encoding: .utf8)!)!
                    data.append(eventObject)
                    //print(response.result.value as! [[String: Any]])
                }
                callback(data)
            }
        }
    }
    
    func fetchTasks(startDate: String, callback: @escaping ([EventObject]) -> Void) {
        Alamofire.request(baseURL + "events.json", method: .get, parameters: ["start_at_date": startDate])
            .responseJSON{ response in
                if response.response?.statusCode == 200 {
                    var data: [EventObject] = []
                    for item in (response.result.value as! [[String: Any]]) {
                        let eventObject: EventObject = Mapper<EventObject>()
                            .map(JSONString: String(data: try! JSONSerialization.data(withJSONObject: item, options: []), encoding: .utf8)!)!
                        data.append(eventObject)
                        //print(response.result.value as! [[String: Any]])
                    }
                    callback(data)
                }
        }
    }
    
    func saveEvent(params: [String: String]) {
        Alamofire.request(baseURL + "events", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                print(response)
                if response.response?.statusCode == 200 {
                    print("save ok")
                }else if response.response?.statusCode == 500 {
                    print("error 500")
                }
        }
    }
    
    func deleteEvent(id: String) {
        Alamofire.request(baseURL + "events/" + id, method: .delete)
            .responseString { response in
                if response.response?.statusCode == 200 {
                    print("delete ok")
                }else if response.response?.statusCode == 500 {
                    print("error 500")
                }
        }
    }
    
    func update(params: [String: String], model: String, id: String) {
        Alamofire.request(baseURL + model + "/" + id, method: .put, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                if response.response?.statusCode == 200 {
                    print("delete ok")
                }else if response.response?.statusCode == 500 {
                    print(response.result.value!)
                    print("error 500")
                }
            }
    }
}
