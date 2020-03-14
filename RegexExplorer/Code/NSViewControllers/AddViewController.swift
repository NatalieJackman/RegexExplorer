//
//  addViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/12/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class AddViewController: NSViewController
{
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var patternTextField: NSTextField!
    @IBOutlet weak var parentNameComboBox: NSComboBox!
    @IBOutlet weak var cancelButton: NSButton!
    @IBOutlet weak var acceptButton: NSButton!
    
    var patternDelegate: PatternProtocolDelegate?
    var groupsViewController: GroupsViewController?
    var patternViewController: PatternViewController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        parentNameComboBox.removeAllItems()
        let groups = (patternViewController?.patternTextView.string.split(separator: "("))!
        for group in groups
        {
            let groupString = String(group)
            let start = groupString.firstIndex(of: "<")
            let stop = groupString.firstIndex(of: ">")
            var value = groupString[start!..<stop!]
            value.removeFirst()
            parentNameComboBox.addItem(withObjectValue: value)
        }
    }
    
    @IBAction func cancelButton_Action(_ sender: Any)
    {
        self.dismiss(self)
    }
    
    @IBAction func acceptButton_Action(_ sender: Any)
    {
        let pattern = patternTextField.stringValue
        let name = nameTextField.stringValue
        let parent = parentNameComboBox.stringValue
        patternDelegate?.AddGroup(pattern:pattern, name:name, parent:parent)
        self.dismiss(self)
    }
}
