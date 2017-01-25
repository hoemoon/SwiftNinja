//
//  main.swift
//  Contacts
//
//  Created by hoemoon on 24/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct Contacts {
    var addressDict: [Int: [String: String]] = [Int: [String: String]]()
    var index = 0
    mutating func getIndex() -> Int {
        self.index += 1
        return self.index
    }
    mutating func insertContact(name: String, address: String) {
        var emptyDict: [String: String] = [:]
        emptyDict[name] = address
        addressDict[getIndex()] = emptyDict
    }
    func getAddressOne(name: String) -> [String] {
        var result: [String] = [String]()
        for (_, outValue) in addressDict {
            for (key, value) in outValue {
                if key == name {
                    result.append(value)
                } else {
                    result.append("Not found")
                }
            }
        }
        return result
    }
    func printAllAddress() {
        for (outKey, outValue) in addressDict {
            for (key, value) in outValue {
                print(outKey, key, value)
            }
        }
    }
}

var contact = Contacts()

var firstInput = ""
while firstInput != "4" {
    print("1 insert address, 2 get one person address, 3 all address print, 4 end")
    firstInput = readLine()!
    switch firstInput {
    case "1":
        print("type name")
        let name = readLine()!
        print("type address")
        let address = readLine()!
        contact.insertContact(name: name, address: address)
        continue
    case "2":
        print("enter name, we will print address")
        let name = readLine()!
        print(contact.getAddressOne(name: name))
        continue
    case "3":
        contact.printAllAddress()
        print()
        continue
    case "4":
        print("end program")
        firstInput = "4"
        continue
    default:
        contact.printAllAddress()
        continue
    }
}
