//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Shaohui Yang on 11/14/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(controller: ListDetailViewController)
    func listDetailviewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist)
    func listDetailViewControoler(controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.enabled = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            delegate?.listDetailViewControoler(self, didFinishEditingChecklist: checklist)
        } else {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailviewController(self, didFinishAddingChecklist: checklist)
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
    
}
