//
//  main.swift
//  PenPineAppleApplePen
//
//  Created by hoemoon on 14/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

print("Hello, World!")

let pen1 = CXPen(withBrand: "pineapple")
pen1.setColor("red")
pen1.setUsage(50)
let pen2 = CXPen(withBrand: "pen")
pen2.setColor("black")
pen2.setUsage(90)
let pen3 = CXPen(withBrand: "apple")
pen3.setColor("yello")
pen3.setUsage(100)

let holder = PenHolder(withCapacity: 5)
holder.add(pen: pen1)
holder.add(pen: pen2)
holder.add(pen: pen3)
holder.printDescription()
print(holder.usage)



