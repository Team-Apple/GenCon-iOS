//
//  EventViewModel.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/26.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct EventViewModel {
    let datas = Variable<[EventObject]>([])
    let request = Requests()
    let ud = UserDefaults()

    init() {
        updateDatas(fetchDate: DateUtils.stringFromDate(date: Date(), format: "yyyy-MM-dd"))
    }

    func selectAtIndex(i: Int) {
        //datas.value.append("a")
    }

    func updateDatas(fetchDate: String) {
        ud.removeObject(forKey: "events")
        let date = fetchDate.replacingOccurrences(of: "/", with: "-")
        request.fetchEvents(startDate: date, callback: {(data: [EventObject]) in
            self.datas.value.removeAll()
            self.datas.value = data
            var events = [EventObject]()
            if self.ud.object(forKey: "events") != nil {
                events = NSKeyedUnarchiver.unarchiveObject(with: self.ud.object(forKey: "events") as! Data) as! [EventObject]
                for i in data {
                    for e in events {
                        if e.id != i.id {
                            events.append(i)
                        }
                    }
                }
                if events.count == 0 {
                    events = data
                }
                let eventsdata = NSKeyedArchiver.archivedData(withRootObject: events)
                self.ud.set(eventsdata, forKey: "events")
            }else {
                let eventsdata = NSKeyedArchiver.archivedData(withRootObject: events)
                self.ud.set(eventsdata, forKey: "events")
            }
        }, callbackError: {
            var events = [EventObject]()
            if self.ud.object(forKey: "events") != nil {
                events = NSKeyedUnarchiver.unarchiveObject(with: self.ud.object(forKey: "events") as! Data) as! [EventObject]
                events = events.filter { $0.startDateTime?.components(separatedBy: " ")[0] == date }
                self.datas.value.removeAll()
                self.datas.value = events
            }else {
                let eventsdata = NSKeyedArchiver.archivedData(withRootObject: events)
                self.ud.set(eventsdata, forKey: "events")
            }
        })
    }

    func deleteEvent(id: String) {
        request.deleteEvent(id: id)
    }
}
