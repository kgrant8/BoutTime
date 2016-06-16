//
//  GameModel.swift
//  BoutTime
//
//  Created by Keith on 6/15/16.
//  Copyright © 2016 Keith. All rights reserved.
//

import Foundation

struct gameStats {
    var correctAnswers = 0
    var roundsPlayed = 0
    let maxNumberOfRounds = 6
    let maxFacts = 4
    var countdownTimer = 60
    
    mutating func newGame() {
         correctAnswers = 0
         roundsPlayed = 0
         countdownTimer = 60
    }
   
}

var game = gameStats()