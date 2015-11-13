//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/10/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    required init?(coder aCoder: NSCoder) {
        super.init()
    }
    
    override init() {
        super.init()
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
