//
//  DataModel.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/15/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    var indexOfSelectedChecklist: Int {
        get{
            return NSUserDefaults.standardUserDefaults().integerForKey("ChecklistIndex")
        }
        set{
            NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: "ChecklistIndex")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    init() {
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    func handleFirstTime() {
        let UserDefaults = NSUserDefaults.standardUserDefaults()
        let firstTime = UserDefaults.boolForKey("FirstTime")
        if firstTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            indexOfSelectedChecklist = 0
            UserDefaults.synchronize()
        }
    }
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1, "FirstTime": true]
        
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
    }
    
    func documentDirectory() ->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath() ->String{
        return (documentDirectory() as NSString).stringByAppendingPathComponent("Checklists.plists")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists") as! [Checklist]
                unarchiver.finishDecoding()
            }
        }
    }
}
