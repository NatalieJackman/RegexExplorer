//
//  patternViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class PatternViewController: NSViewController
{
    @IBOutlet weak var patternScrollView: NSScrollView!
    @IBOutlet var patternTextView: NSTextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        patternTextView.font = NSFont(name: "Arial", size: CGFloat(15))
    }
    
    func SendSampleViewControllerPattern(sampleViewController:SampleViewController, groupsViewController:GroupsViewController)
    {
        sampleViewController.RunRegexMatch(pattern: patternTextView.string, groupsViewController: groupsViewController)
    }
    
    func AddGroupToPattern(groupValue:NSString, groupName:NSString, parent:NSString)
    {
        
    }
}
