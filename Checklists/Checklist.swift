//
//  Checklist.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/14/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    func countUncheckedItems() -> Int{
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
    func sortChecklistItems() {
        items.sortInPlace({checklistItem1, checklistItem2 in return checklistItem1.dueDate.compare(checklistItem2.dueDate) == .OrderedAscending})
    }
}
