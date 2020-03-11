//
//  sampleViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class SampleViewController: NSViewController
{
    @IBOutlet weak var sampleScrollView: NSScrollView!
    @IBOutlet var sampleTextView: NSTextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sampleTextView.font = NSFont(name: "Arial", size: CGFloat(15))
    }
    
    func ProcessPatternFeedback(groups:[RegexGroup])
    {
        for group in groups
        {
            sampleTextView.setTextColor(group.color, range: group.range)
            sampleTextView.font = group.font
        }
    }
    
    func RunRegexMatch(pattern:String, groupsViewController: GroupsViewController)
    {
        let length = sampleTextView.string.utf16.count
        let range = NSRange(location: 0, length: length)
        let regex = try! NSRegularExpression(pattern: pattern)
        let results = regex.matches(in: sampleTextView.string, options: [], range: range)
        groupsViewController.ProcessRegexMatchResults(results: results, sample:sampleTextView.string as NSString, sampleViewController:self)
    }
}
