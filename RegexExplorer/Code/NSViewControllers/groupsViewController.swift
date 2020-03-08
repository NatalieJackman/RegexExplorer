//
//  groupsViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class GroupsViewController: NSViewController
{
    @IBOutlet weak var groupsComboBox: NSComboBox!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func ProcessRegexMatchResults(results:[NSTextCheckingResult], sample:NSString, sampleViewController:SampleViewController)
    {
        var groups = [String]()
        for result in results
        {
            let numberOfPasses = result.numberOfRanges - 1
            for onRange in 0...numberOfPasses
            {
                let range = result.range(at: onRange)
                let groupString = sample.substring(with: range)
                groupsComboBox.addItem(withObjectValue: "group \(onRange+1): \(groupString)");
                groupsComboBox.selectItem(at: 0)
                groups.insert(groupString, at: onRange)
            }
        }
        sampleViewController.ProcessPatternFeedback(groups: groups)
    }
}
