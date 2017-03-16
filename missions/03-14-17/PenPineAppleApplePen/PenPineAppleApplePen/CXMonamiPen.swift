//
//  CXMonamiPen.swift
//  PenPineAppleApplePen
//
//  Created by hoemoon on 15/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class CXMonamiPen: CXPen {
    
    private var modelName = String()
    init(withModel: String) {
        modelName = withModel
        super.init(withBrand: "Monami")
    }
    convenience init() {
        self.init(withModel: "modelName111")
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

class CXRedPen: CXMonamiPen {
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "RED"
    }
}
class CXBluePen: CXMonamiPen {
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "BLUE"
    }
}
class CXBlackPen: CXMonamiPen {
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "BLACK"
    }
}
