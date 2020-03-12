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
    @IBOutlet weak var parentNameTextField: NSTextField!
    @IBOutlet weak var cancelButton: NSButton!
    @IBOutlet weak var acceptButton: NSButton!
    
    var delegate: PatternProtocolDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton_Action(_ sender: Any)
    {
        self.dismiss(self)
    }
    
    @IBAction func acceptButton_Action(_ sender: Any)
    {
        let pattern = patternTextField.stringValue
        let name = nameTextField.stringValue
        let parent = parentNameTextField.stringValue
        delegate?.AddGroup(pattern:pattern, name:name, parent:parent)
        self.dismiss(self)
    }
}
