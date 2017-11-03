//
//  DateUtils.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)!
    }
    
    class func stringFromDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
