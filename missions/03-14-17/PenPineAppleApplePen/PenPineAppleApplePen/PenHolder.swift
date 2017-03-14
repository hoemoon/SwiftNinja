//
//  PenHolder.swift
//  PenPineAppleApplePen
//
//  Created by hoemoon on 14/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class PenHolder {
    private var pens: [CXPen]
    private var capacity: Int
    var usage: Double {
        get {
            return (Double(pens.count) / Double(self.capacity)) * 100
        }
    }
    init(withCapacity: Int) {
        pens = [CXPen]()
        capacity = withCapacity
    }    
    func add(pen: CXPen) {
        pens.append(pen)
    }
    func remove(penIndex: Int) {
        pens.remove(at: penIndex)
    }
    func printDescription() {
        print("Pens : \(pens), Usage: \(usage)")
    }
}
