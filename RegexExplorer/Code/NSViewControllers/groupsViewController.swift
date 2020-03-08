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
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func ProcessRegexMatchResults(results:[NSTextCheckingResult])
    {
        for result in results
        {
            print("result.numberOfRanges is \(result.numberOfRanges)")
        }
    }
}
