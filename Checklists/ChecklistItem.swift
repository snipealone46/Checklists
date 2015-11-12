//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/10/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
