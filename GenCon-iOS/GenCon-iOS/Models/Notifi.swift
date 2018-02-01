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
    func set(text: String, date: String) {
        //　通知設定に必要なクラスをインスタンス化
        let trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        
        // トリガー設定
        notificationTime.year = 2018
        notificationTime.month = 2
        notificationTime.day = 1
        notificationTime.hour = 12
        notificationTime.minute = 0
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // 通知内容の設定
        content.title = ""
        content.body = ""
        content.sound = UNNotificationSound.default()
        
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
