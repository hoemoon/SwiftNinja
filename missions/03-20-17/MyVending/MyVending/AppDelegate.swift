//
//  AppDelegate.swift
//  MyVending
//
//  Created by hoemoon on 20/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 처음켜면 실행 #1
//        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? [String:Int] {
//            if stocks.count != 0 {
//                print("application", stocks)
//                vc.setStocks(stocks: stocks)
//            }
//        }
        
        let vc = window?.rootViewController as! ViewController
//        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? Data {
//            print(stocks)
//            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: stocks) as? [String:[Beverage]] {
//                print(unarch)
//                vc.setUnarchive(unarchived: unarch)
//            } else {
//                vc.cokeCount.text = "0"
//                vc.cidarCount.text = "0"
//            }
//            
//        }
        // Unarchive machine
        if let machine = UserDefaults.standard.object(forKey: "machine") as? Data {
            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: machine) as? VendingMachine {
                vc.setMachine(machine: unarch)
            } else {
                vc.cokeCount.text = "0"
                vc.cidarCount.text = "0"
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let vc = window?.rootViewController as! ViewController
        let stocks = vc.getStocksForArchive()
        // UserDefaults.standard.set(stocks, forKey: "stocks")
        print("applicationDidEnterBackground")
        
        let data = NSKeyedArchiver.archivedData(withRootObject: stocks) // [String:[Beavrage]]
        UserDefaults.standard.set(data, forKey: "stocks")
        
        // archive vendingmachine
        let machine = vc.getMachine()
        let dateOfMachine = NSKeyedArchiver.archivedData(withRootObject: machine)
        UserDefaults.standard.set(dateOfMachine, forKey: "machine")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        print("applicationWillEnterForeground")
        let vc = window?.rootViewController as! ViewController
//        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? Data {
//            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: stocks) as? [String:[Beverage]] {
//                vc.setUnarchive(unarchived: unarch)
//            }
//        }
        // Unarchive machine
        if let machine = UserDefaults.standard.object(forKey: "machine") as? Data {
            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: machine) as? VendingMachine {
                vc.setMachine(machine: unarch)
            }
        }
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        // 들락날락 할때마다 실행된다.
        // 처음켜면 실행 #2
        print("applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminatce")

    }
}

