//
//  Protocol.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

protocol SampleProtocolDelegate
{
    func RunRegexMatch(pattern:NSString)
}

protocol PatternProtocolDelegate
{
    func PatternValueChanged(pattern: NSString)
}
