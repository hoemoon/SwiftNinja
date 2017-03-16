//
//  MyCalendar.swift
//  MyCalendar
//
//  Created by hoemoon on 16/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class MyCalendar {
    // return: today's (year, month, day, hour, minute, second)
    func getToday() -> (Int, Int, Int, Int, Int, Int) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd hh:mm:ss"
        var rawDate = dateFormatter.string(from: date).components(separatedBy: " ")
        let time = rawDate[3].components(separatedBy: ":").map { Int($0)! }
        rawDate.remove(at: 3)
        let converted = rawDate.map { Int($0)! }

        return (converted[0], converted[1], converted[2], time[0], time[1], time[2])
    }
    
    // return: Date instance, input: year, month, day :String
    func getSpecificDate(yearMonthDay: String) -> Date {
        let input = yearMonthDay.components(separatedBy: "-")
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        return calendar.date(era: 0, year: Int(input[0])!, month: Int(input[1])!, day: Int(input[2])!, hour: 0, minute: 0, second: 0, nanosecond: 0)!
    }
    
    // return: Date instance, input: year, month, day :Int
    func getSpecificDate(year: Int, month: Int, day: Int) -> Date {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let component = DateComponents(calendar: cal, year: year, month: month, day: day)
        return cal.date(from: component)!
    }
    
    // return: korean style date, input: today Date instance
    func getKoreanDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd hh:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    // return: 해당 달의 1일의 요일, input: 특정한 년도, 특정한 달
    func getFirstWeekdayOfMonth(year: String, month: String) -> String {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let component = DateComponents(calendar: cal, year: Int(year)!, month: Int(month)!, day: 1)
        let date:Date = cal.date(from: component)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatter.string(from: date)
        return dateFormatter.string(from: date)
    }
    
    // return: 한달치 [[주단위 일자]], input: 특정한 년도, 특정한 달
    func getMonth(year: String, month: String) -> [[String]] {
        var result = [[String]]()
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let lastComponent = DateComponents(calendar: cal, day: -1)
        
        let targetMonthComponent = DateComponents(calendar: cal, year:Int(year)!, month: Int(month)! + 1)
        let targetMonth:Date = cal.date(from: targetMonthComponent)!
        
        let firstDay = cal.date(from: targetMonthComponent)
        let lastDay = cal.date(byAdding: lastComponent, to: targetMonth)
        
        var dayFomatter = DateFormatter()
        dayFomatter.dateFormat = "dd"
        
        let last:Int = Int(dayFomatter.string(from: lastDay!))!
        let first:Int = Int(dayFomatter.string(from: firstDay!))!
        
        // 요일 찾는 함수
        func getWeek(day: String) -> String {
            let dateFormatter = DateFormatter()
             let target = DateComponents(calendar: cal, year:Int(year)!, month: Int(month)!, day: Int(day)!)
            let date = cal.date(from: target)
            dateFormatter.dateFormat = "EEE"
            return dateFormatter.string(from: date!)
        }
        
        var tempArray:[String] = [String]()
        for item in first...last {
            if getWeek(day: String(item)) == "Sat" {
                tempArray.append(String(item))
                result.append(tempArray)
                tempArray = [String]()
            } else {
                tempArray.append(String(item))
            }
        }
        result.append(tempArray)
        
        return result
    }
}
