//
//  Person.swift
//  Person
//
//  Created by hoemoon on 31/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct Person {
    let filePath = Bundle.main.path(forResource: "persons", ofType: ".txt")
    var convertedArray = [[String]]()
    var personString = ""

    init() {
        personString = try! String(contentsOfFile: filePath!)
        
        let separatedNewline = personString.components(separatedBy: "\n")
        for item in separatedNewline {
            convertedArray.append(item.components(separatedBy: ","))
        }
        print(personString)
        print(convertedArray)
    }
    
    //파일 다루기
    func personName(atIndex: Int) -> String {
        
        return ""
    }
    
    func personNumber(atIndex: Int) -> Int {
        
        return 0
    }
    
    func isMale(atIndex: Int) -> Bool {
        return true
    }
    
    func personTeam(atIndex: Int) -> Int {
        return 0
    }
    
    func getPersonObject(atIndex: Int) -> [String:Any] {
        return ["stirng": "any"]
    }
    
    // 검색
    func findPersonName(byNumber: Int) -> String {
        return ""
    }
    
    func findPersonNumber(byName: String) -> Int {
        return 0
    }
    
    // 정렬
    func sortedByName() -> [[String: Any]] {
        return [["stirng": "any"]]
    }
    
    func sortByNumber() -> [[String: Any]] {
        return [["stirng": "any"]]
    }
    
    func sortByTeam() -> [[String: Any]] {
        return [["stirng": "any"]]
    }
    
    // 필터
    func filter(byTeam: Int) -> [[String: Any]] {
        return [["stirng": "any"]]
    }
    
    func filter(byGender: Bool) -> [[String: Any]] {
        return [["stirng": "any"]]
    }
    
    func filterDistinctByLastName() -> [[String: Any]] {
        return [["stirng": "any"]]
    }
}
