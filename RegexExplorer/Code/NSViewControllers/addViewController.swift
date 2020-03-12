//
//  addViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/12/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class addViewController: NSViewController
{
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var patternTextField: NSTextField!
    @IBOutlet weak var parentNameTextField: NSTextField!
    @IBOutlet weak var cancelButton: NSButton!
    @IBOutlet weak var acceptButton: NSButton!
    
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
        
    }
}
