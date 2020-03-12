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
        initialize()
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "AddGroupSegue")
        {
            let vc = segue.destinationController as! AddViewController
            vc.delegate = patternViewController
        }
    }
    
    @IBAction func runToolbarItem_Action(_ sender: Any)
    {
        patternViewController.SendSampleViewControllerPattern(sampleViewController: sampleViewController, groupsViewController:groupsViewController)
    }
    
    @IBAction func addToolbarItem_Action(_ sender: Any)
    {
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
