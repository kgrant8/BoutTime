//
//  FactModel.swift
//  BoutTime
//
//  Created by Keith on 6/10/16.
//  Copyright © 2016 Keith. All rights reserved.
//

import Foundation

protocol Factable {
    var fact: String {get set }
    var date: AnyObject {get set }
    var source: String {get set }
}

struct Fact: Factable {
    var fact: String
    var date: AnyObject
    var source: String
}

enum ButtonName: Int {
    case A_Up = 1
    case B_Down
    case B_Up
    case C_Down
    case C_Up
    case D_Up
}


//Getting all Facts off MovieList.plist
var facts = loadFacts()

