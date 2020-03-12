//
//  Protocol.swift
//  RegexExplorer
//
//  Created by Natalie Jackman on 3/7/20.
//  Copyright © 2020 Natalie Jackman. All rights reserved.
//

import Cocoa

protocol PatternProtocolDelegate
{
    func AddGroup(pattern:String, name:String, parent:String)
}
