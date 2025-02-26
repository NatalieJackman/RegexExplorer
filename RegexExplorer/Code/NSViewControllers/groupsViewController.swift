//
//  groupsViewController.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa
import SystemExtensions

class GroupsViewController: NSViewController
{
    @IBOutlet weak var groupsComboBox: NSComboBox!
    @IBOutlet weak var groupsColorWell: NSColorWell!
    @IBOutlet weak var groupsFontSizeComboBox: NSComboBox!
    @IBOutlet weak var groupsFontNameComboBox: NSComboBox!
    
    var groupColor = [NSColor]()
    var groups = [RegexGroup]()
    
    var sampleViewController = SampleViewController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        for font in NSFontManager.shared.availableFontFamilies
        {
            groupsFontNameComboBox.addItem(withObjectValue: font)
        }
        for size in 1 ... 60
        {
            groupsFontSizeComboBox.addItem(withObjectValue: size)
        }
        groupsFontNameComboBox.selectItem(withObjectValue: "Arial")
        groupsFontSizeComboBox.selectItem(withObjectValue: 15)
    }
    
    @IBAction func groupsComboBox_Action(_ sender: Any)
    {
        groupsColorWell.color = GetGroupColor(number: groupsComboBox.indexOfSelectedItem)
    }
    
    @IBAction func groupsColorWell_Action(_ sender: Any)
    {
        groupColor[groupsComboBox.indexOfSelectedItem] = groupsColorWell.color
        groups[groupsComboBox.indexOfSelectedItem].color = groupsColorWell.color
        sampleViewController.ProcessPatternFeedback(groups: groups)
    }
    
    @IBAction func groupsFontNameComboBox_Action(_ sender: Any)
    {
        ProcessFontParameterChange()
    }
    
    @IBAction func groupsFontSizeComboBox_Action(_ sender: Any)
    {
        ProcessFontParameterChange()
    }
    
    func ProcessFontParameterChange()
    {
        if groups.count > 0
        {
            groups[0].font = NSFont(name: groupsFontNameComboBox.stringValue, size: CGFloat(groupsFontSizeComboBox!.intValue))!
            sampleViewController.ProcessPatternFeedback(groups: groups)
        }
    }
    
    func GetGroupColor(number:Int) -> NSColor
    {
        var color = NSColor()
        if number >= groupColor.count
        {
            color = .random()
            groupColor.insert(color, at:number)
        }
        else
        {
            color = groupColor[number]
        }
        return color
    }
    
    func ProcessRegexMatchResults(results:[NSTextCheckingResult], sample:NSString, sampleViewController:SampleViewController)
    {
        groups.removeAll()
        groupsComboBox.removeAllItems()
        self.sampleViewController = sampleViewController
        for result in results
        {
            let numberOfPasses = result.numberOfRanges - 1
            for onRange in 0...numberOfPasses
            {
                let regexGroup = RegexGroup()
                let range = result.range(at: onRange)
                let groupString = sample.substring(with: range)
                groupsComboBox.addItem(withObjectValue: "group \(onRange+1): \(groupString)")
                
                regexGroup.value = groupString
                regexGroup.color = GetGroupColor(number: onRange)
                regexGroup.font = NSFont(name: groupsFontNameComboBox.stringValue, size: CGFloat(groupsFontSizeComboBox!.intValue))!
                regexGroup.range = range
                groups.insert(regexGroup, at: onRange)
            }
        }
        groupsComboBox.selectItem(at: 0)
        groupsColorWell.color = GetGroupColor(number: 0)
        sampleViewController.ProcessPatternFeedback(groups: groups)
    }
}

extension CGFloat
{
    static func random() -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension NSColor
{
    static func random() -> NSColor
    {
        return NSColor(deviceRed: .random(),
                       green: .random(), blue: .random(), alpha: 1.0)
    }
}
