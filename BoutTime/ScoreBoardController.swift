//
//  ScoreBoardController.swift
//  BoutTime
//
//  Created by Keith on 6/15/16.
//  Copyright © 2016 Keith. All rights reserved.
//

import UIKit

class ScoreBoardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       showScore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func showScore(){
        scoreLabel.text = "You Scored: \(game.correctAnswers)/\(game.maxNumberOfRounds)"
    }

    @IBAction func playAgain() {
        game.newGame()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
   
}
