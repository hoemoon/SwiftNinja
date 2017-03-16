//
//  main.swift
//  MyCalendar
//
//  Created by hoemoon on 16/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation


let calendar = MyCalendar()
print(calendar.getToday())
print(calendar.getSpecificDate(year: 2017, month: 3, day: 15))
print(calendar.getSpecificDate(yearMonthDay: "2017-03-15"))
print(calendar.getFirstWeekdayOfMonth(year: "2017", month: "3"))

print(calendar.getMonth(year: "2017", month: "3"))
