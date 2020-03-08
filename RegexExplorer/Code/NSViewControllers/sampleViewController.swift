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
    }
    
    func RunRegexMatch(pattern:String, groupsViewController: GroupsViewController)
    {
        let length = sampleTextView.string.utf16.count
        let range = NSRange(location: 0, length: length)
        let regex = try! NSRegularExpression(pattern: pattern)
        let results = regex.matches(in: sampleTextView.string, options: [], range: range)
        groupsViewController.ProcessRegexMatchResults(results: results)
        print("sampleViewController runRegexMatch pattern is \(pattern)")
    }
}
