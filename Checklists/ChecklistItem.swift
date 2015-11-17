//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/10/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
        super.init()
    }
    convenience override init(){
        self.init(text: "", checked: false)
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
