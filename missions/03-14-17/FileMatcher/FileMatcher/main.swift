//
//  main.swift
//  FileMatcher
//
//  Created by hoemoon on 14/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Cocoa

let dir = "/Users/hoemoon/playground/SwiftNinja/mission/03-14-17"
let dir2 = "/Users/hoemoon/playground/SwiftNinja/"
let matcher = FileMatcher()
print(matcher.allFiles(atPath: dir2))
//print(matcher.allFiles(atPath: dir2))
//print(matcher.sortedFiles(atPath: "/Users/hoemoon/Downloads"))
//print(matcher.isExist(filename: "README.md", atPath: dir2))
//print(matcher.searchByExtension(extensionName: "pdf", atPath: "/Users/hoemoon/Downloads"))
