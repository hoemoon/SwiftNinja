struct Contacts {
    var addressDict : [Int:[String: String]] = [Int:[String: String]]()
    var index = 0
    
    mutating func getIndex() -> Int {
        self.index += 1
        return self.index
    }
    
    mutating func insertContact(name:String, address:String) {
        var emptyDict: [String: String] = [:]
        emptyDict[name] = address
        addressDict[getIndex()] = emptyDict
    }

    func getAddressOne(name: String) -> String {
        var result: String = ""
        for (outKey, outValue) in addressDict {
            for (key, value) in outValue {
                if(key == name) {
                    result = value
                } else {
                    result = "Not found"
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
