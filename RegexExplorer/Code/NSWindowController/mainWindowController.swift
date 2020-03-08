//
//  mainWindowController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

class mainWindowController: NSWindowController
{
    @IBOutlet weak var runToolbarItem: NSToolbarItem!
    @IBOutlet weak var mainWindowController: mainWindow!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
    }
    
    @IBAction func runToolbar_Action(_ sender: Any)
    {
        let patternViewController = GetViewControllerInSplitView(title: "PatternViewController") as! PatternViewController
        let sampleViewController = GetViewControllerInSplitView(title: "SampleViewController") as! SampleViewController
        patternViewController.SendSampleViewControllerPattern(sampleViewController: sampleViewController)
    }
    
    func GetViewControllerInSplitView(title:String) -> NSViewController
    {
        var viewController =  NSViewController()
        if title.isEmpty == false
        {
            for childViewController in mainWindowController.contentViewController!.children
            {
                if childViewController.title == title
                {
                    viewController = childViewController
                    break
                }
            }
        }
        return viewController
    }
}
