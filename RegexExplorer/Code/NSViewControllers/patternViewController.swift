//
//  patternViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class patternViewController: NSViewController, NSTextViewDelegate
{
    @IBOutlet weak var patternScrollView: NSScrollView!
    @IBOutlet var patternTextView: NSTextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func complete(_ sender: Any?)
    {
        print ("complete patternTextView.string = \(patternTextView.string)")
    }
}
