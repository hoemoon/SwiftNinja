//
//  ViewController.swift
//  RealmPractice
//
//  Created by hoemoon on 26/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let myClass = CodeSquad(value: [Date(), "hello"])
        let myClass2 = CodeSquad(value: [Date(), "hello222"])
        
        try! realm.write {
            realm.add(myClass)
            realm.add(myClass2)
        }
        let classes = realm.objects(CodeSquad.self)
        
        for item in classes {
            print(item.text)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

