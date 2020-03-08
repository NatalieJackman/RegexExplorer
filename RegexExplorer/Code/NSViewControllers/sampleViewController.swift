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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func RunRegexMatch(pattern:String)
    {
        print("sampleViewController runRegexMatch")
    }
}
