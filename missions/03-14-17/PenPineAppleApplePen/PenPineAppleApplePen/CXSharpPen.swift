//
//  CXSharpPen.swift
//  PenPineAppleApplePen
//
//  Created by hoemoon on 15/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation
class CXSharpPen: CXPen {
    
    fileprivate var modelName = String()
    init(withModel: String) {
        modelName = withModel
        super.init(withBrand: "Sharp")
    }
    convenience init() {
        self.init(withModel: "modelName000")
    }
    
    var model: String {
        get {
            return modelName
        }
        set(name) {
            self.modelName = name
        }
    }
    override func printDescription() {
        print("Brand: \(self.brandName), Color: \(self.colorName), Usage: \(self.usagePercent), Model : \(modelName)")
    }
}
