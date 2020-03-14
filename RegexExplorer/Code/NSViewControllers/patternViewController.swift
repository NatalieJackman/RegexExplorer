//
//  patternViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa
import Foundation

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
            if parent.count > 0
            {
                if let range = patternTextView.string.range(of: parent)
                {
                    let substring = patternTextView.string[..<range.lowerBound]
                    var string = String(substring)
                    string = "\(string)\(parent)>"
                    print(string)
                    patternTextView.string.append(field)
                }
            }
            else
            {
                patternTextView.string.append(field)
            }
        }
        else
        {
            patternTextView.string = field
        }
    }
}
