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
    @IBOutlet weak var addToolbarItem: NSToolbarItem!
    @IBOutlet weak var mainWindowController: mainWindow!
    
    var initialized = false
    var patternViewController = PatternViewController()
    var sampleViewController = SampleViewController()
    var groupsViewController = GroupsViewController()
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
    }
    
    @IBAction func runToolbarItem_Action(_ sender: Any)
    {
        if initialized == false
        {
            initialize()
        }
        patternViewController.SendSampleViewControllerPattern(sampleViewController: sampleViewController, groupsViewController:groupsViewController)
    }
    
    @IBAction func addToolbarItem_Action(_ sender: Any)
    {
        if initialized == false
        {
            initialize()
        }
        
    }
    
    func initialize()
    {
        initialized = true
        patternViewController = GetViewControllerInSplitView(title: "PatternViewController") as! PatternViewController
        sampleViewController = GetViewControllerInSplitView(title: "SampleViewController") as! SampleViewController
        groupsViewController = GetViewControllerInSplitView(title: "GroupsViewController") as! GroupsViewController
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
