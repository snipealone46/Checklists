//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/10/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text: String
    var checked: Bool
    var shouldRemind: Bool
    var dueDate = NSDate()
    var itemID: Int
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        dueDate = aDecoder.decodeObjectForKey("DueDate") as! NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID = aDecoder.decodeIntegerForKey("ItemID")
        super.init()
    }
    
    init(text: String, checked: Bool, shouldRemind: Bool) {
        self.text = text
        self.checked = checked
        self.shouldRemind = shouldRemind
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    convenience override init(){
        self.init(text: "", checked: false, shouldRemind: false)
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }

    
    func toggleChecked() {
        checked = !checked
    }
}
