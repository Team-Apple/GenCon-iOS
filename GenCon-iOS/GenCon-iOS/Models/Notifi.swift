//
//  Notifi.swift
//  GenCon-iOS
//
//  Created by Taillook on 2018/02/01.
//  Copyright © 2018年 Taillook. All rights reserved.
//

import Foundation
import UserNotifications

class Notifi {
    func set(mode: String, text: String, date: String) {
        //　通知設定に必要なクラスをインスタンス化
        let trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        
        // トリガー設定
        let date = date.components(separatedBy: " ")[0]
        let time = date.components(separatedBy: " ")[1]
        notificationTime.year = Int(date.components(separatedBy: "-")[0])
        notificationTime.month = Int(date.components(separatedBy: "-")[1])
        notificationTime.day = Int(date.components(separatedBy: "-")[2])
        notificationTime.hour = Int(time.components(separatedBy: ":")[0])
        notificationTime.minute = Int(time.components(separatedBy: ":")[1])
        notificationTime.second = Int(time.components(separatedBy: ":")[2])
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        // 通知内容の設定
        content.title = mode
        content.body = text
        content.sound = UNNotificationSound.default()

        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
