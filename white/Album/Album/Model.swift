//
//  Model.swift
//  Album
//
//  Created by hoemoon on 29/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct Model {
    var tempArray = [[String:String]]()
    var sortedArray = [[String:String]]()
    var sectionedArray = [[[String:String]]]()

    let jsonString = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20150116\"}," +
        "{\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20160505\"}," + "{\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20141212\"}," + "{\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20140301\"}," + "{\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20150101\"}," + "{\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20150707\"}," + "{\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20140815\"}," + "{\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20161231\"}," + "{\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20150102\"}," + "{\"title\":\"나비\",\"image\":\"10.jpg\",\"date\":\"20141225\"}]"
    
    init() {
        let data: Data = jsonString.data(using: .utf8)!
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let array = json as? [[String:String]] {
            tempArray = array
        }
        tempArray.sort(by: {String(describing: $0["title"]) < String(describing: $1["title"])})
    }
    
    mutating func sortByTitle() {
        sortedArray = tempArray.sorted(by: {String(describing: $0["title"]) < String(describing: $1["title"])})
    }
    
    mutating func sortByDate() {
        sortedArray = tempArray.sorted(by: {String(describing: $0["date"]) < String(describing: $1["date"])})

    }
    
    mutating func makeSections() {
        // 중복없는 연도 집합 만들기
        var yearSet = Set<String>()
        for item in sortedArray {
            yearSet.insert(String(Array(item["date"]!.characters)[3]))
        }
        
        // 필터에 쓸 판별 함수
        func isThatYear(year:String) -> (_ photo: [String:String]) -> Bool {
            func isThatYear(photo: [String:String]) -> (Bool) {
                let tempArray = Array(photo["date"]!.characters)
                return String(tempArray[3]) == year
            }
            return isThatYear
        }
        // 필터링 하기 그리고 최종 배열에 넣기
        for year in yearSet.sorted() {
            let fileted = sortedArray.filter(isThatYear(year: year))
            sectionedArray.append(fileted)
        }

    }
}
