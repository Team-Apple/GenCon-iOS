//
//  Requests.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/30.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import Alamofire

class Requests {
    let baseURL = ""
    
    func fetchEvents() {
        Alamofire.request("http://grapebread.net/testevent/event", method: .get, parameters: nil).responseJSON { response in
            if response.result.isSuccess {
                print((response.result.value as! [[String: String]])[0]["title"]!)
            }else{
                //fail(response.result.error)
            }
        }
    }
}
