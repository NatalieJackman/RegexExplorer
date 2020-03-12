//
//  patternViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class PatternViewController: NSViewController, PatternProtocolDelegate
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
    
    func AddGroup(pattern: String, name: String, parent: String)
    {
        let field = "(?<\(name)>\(pattern))"
        if patternTextView.string.count > 0
        {
            patternTextView.string.append(field)
        }
        else
        {
            patternTextView.string = field
        }
    }
}
