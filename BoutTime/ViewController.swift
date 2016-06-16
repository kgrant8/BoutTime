//
//  ViewController.swift
//  BoutTime
//
//  Created by Keith on 6/10/16.
//  Copyright © 2016 Keith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ResetAllForNewRound()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
               
    }
  
    //Four Buttons for all movies - non clickable
    @IBOutlet weak var factButton1: UIButton!
    @IBOutlet weak var factButton2: UIButton!
    @IBOutlet weak var factButton3: UIButton!
    @IBOutlet weak var factButton4: UIButton!
    
    //60 second timer
    var timer = NSTimer()
   
   
    
    @IBOutlet weak var arrowButton: UIButton!
    
    //Next Round button, hidden = true;
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var instructionsText: UITextField! // instructions at bottom label, Changes after 5 seconds
    
    //Func used to countdown timer
    func countdown() {
        game.countdownTimer -= 1
        
        if (game.countdownTimer == 55)
        {
            instructionsText.text = "Shake to complete the round"
        }
        
        if game.countdownTimer < 10{
        timerLabel.text = "0:0\(game.countdownTimer)"
        }
        else{
            timerLabel.text = "0:\(game.countdownTimer)"
        }
        
        if (game.countdownTimer == 0){
            timer.invalidate()
            checkAnswers()
        }
        
    }
    func startTimer(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timerLabel.hidden = false;
    }
    
    //Making this View a first Responder
    override func canBecomeFirstResponder() -> Bool {
        return true;
    }
    //Handling the shake Gesture
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if (motion == .MotionShake){
            timer.invalidate()
            instructionsText.text = "Tap events to learn more"
            game.countdownTimer = 60;
            checkAnswers()
        }
    }

    @IBAction func nextRound() {
        
        //If 6th round Fire off Scoreboard ViewController
        if game.roundsPlayed == game.maxNumberOfRounds{
            timer.invalidate()
            performSegueWithIdentifier("ScoreBoard", sender: nil)
            ResetAllForNewRound()
            
        }//Kepep playing
        else{
          ResetAllForNewRound()
            
        }


    }
 //Display New set of Movies on the screen
// setting button.tag to the year the movie was released
func displayFacts (){
    
        
        
        for i in 0..<game.maxFacts {
            switch i {
            case 0:
                factButton1.setTitle(factSet[i].fact, forState: .Normal)
                factButton1.tag = i
                factButton1.titleLabel?.numberOfLines = 0
                factButton1.titleLabel?.textAlignment = .Left
                
            case 1:
                factButton2.setTitle(factSet[i].fact, forState: .Normal)
                factButton2.tag = i
                factButton2.titleLabel?.numberOfLines = 0
                factButton2.titleLabel?.textAlignment = .Left
                
                
            case 2:
                factButton3.setTitle(factSet[i].fact, forState: .Normal)
                factButton3.tag = i
                factButton3.titleLabel?.numberOfLines = 0
                factButton3.titleLabel?.textAlignment = .Left

            case 3:
                factButton4.setTitle(factSet[i].fact, forState: .Normal)
                factButton4.tag = i
                factButton4.titleLabel?.numberOfLines = 0
                factButton4.titleLabel?.textAlignment = .Left

                
            default:
                print("We have a problem Displaying Questions")
            }
            
            
        }
            
      
        
    }
    
    func checkAnswers ()
    {
        game.roundsPlayed += 1;
       
        let event1: Int = factSet[factButton1.tag].date as! Int
        let event2: Int = factSet[factButton2.tag].date as! Int
        let event3: Int = factSet[factButton3.tag].date as! Int
        let event4: Int = factSet[factButton4.tag].date as! Int
        
        
        //Checking to see if the events are in the right oder. Newest movie is event1
        if(event1 >= event2 && event2 >= event3 && event3 >= event4)
        {
            
            game.correctAnswers += 1
            timerLabel.hidden = true;
            nextRoundButton.hidden = false;
            nextRoundButton.setImage(correctAnswersImage, forState: .Normal)
            
            
        }
        else
        {
            timerLabel.hidden = true;
            nextRoundButton.hidden = false;
            nextRoundButton.setImage(wrongAnswersImage, forState: .Normal)
        }
        enableAllButtons()
        
    }
    
    //Handles all swapping of buttons and updating the views when an up or down arrow is clicked
    
    @IBAction func arrowTouched(sender: UIButton) {
       
        
        
        switch sender.tag {
           
        case ButtonName.A_Up.rawValue:
            sender.setImage(down_full_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton1.currentTitle!;
            let tempTag = factButton1.tag
            factButton1.setTitle(factButton2.currentTitle, forState: .Normal)
            factButton2.setTitle(tempTitle, forState: .Normal)
            
            factButton1.tag = factButton2.tag
            factButton2.tag = tempTag
        
        case ButtonName.B_Down.rawValue:
            sender.setImage(down_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton2.currentTitle!;
            let tempTag = factButton2.tag
            factButton2.setTitle(factButton3.currentTitle, forState: .Normal)
            factButton3.setTitle(tempTitle, forState: .Normal)
            
            factButton2.tag = factButton3.tag
            factButton3.tag = tempTag;
            
        case ButtonName.B_Up.rawValue:
            sender.setImage(up_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton1.currentTitle!;
            let tempTag = factButton1.tag
            factButton1.setTitle(factButton2.currentTitle, forState: .Normal)
            factButton2.setTitle(tempTitle, forState: .Normal)
            
            factButton1.tag = factButton2.tag
            factButton2.tag = tempTag;
           
        case ButtonName.C_Down.rawValue:
            sender.setImage(down_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton3.currentTitle!;
            let tempTag = factButton3.tag
            factButton3.setTitle(factButton4.currentTitle, forState: .Normal)
            factButton4.setTitle(tempTitle, forState: .Normal)
            
            factButton3.tag = factButton4.tag
            factButton4.tag = tempTag;
            
        case ButtonName.C_Up.rawValue:
            sender.setImage(up_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton2.currentTitle!;
            let tempTag = factButton2.tag
            factButton2.setTitle(factButton3.currentTitle, forState: .Normal)
            factButton3.setTitle(tempTitle, forState: .Normal)
            
            factButton2.tag = factButton3.tag
            factButton3.tag = tempTag;
       
        case ButtonName.D_Up.rawValue:
            sender.setImage(up_full_arrow_selected, forState: .Highlighted)
            let tempTitle = factButton3.currentTitle!;
            let tempTag = factButton3.tag
            factButton3.setTitle(factButton4.currentTitle, forState: .Normal)
            factButton4.setTitle(tempTitle, forState: .Normal)
            
            factButton3.tag = factButton4.tag
            factButton4.tag = tempTag;
        default:
            print("fail")
            
        }
        
       
        
        
    }
    //Function used to load a newWebView when user clicks on movie title after the round is over
    @IBAction func webViewClicked(sender: AnyObject) {
        let source =  factSet[sender.tag].source         
        let url = NSURL(string: source)!
        
        UIApplication.sharedApplication().openURL(url)
    }
    //Disables all 4 movie title buttons - No cheating!
    func disableAllButtons(){
        
        factButton1.enabled = false;
        factButton2.enabled = false;
        factButton3.enabled = false;
        factButton4.enabled = false;
        
    }
    //Enables all 4 movie title buttons
    func enableAllButtons(){
        factButton1.enabled = true;
        factButton2.enabled = true;
        factButton3.enabled = true;
        factButton4.enabled = true;
        
    }
    func ResetAllForNewRound(){
        
        timerLabel.text = "1:00"
        instructionsText.text = "Most recent movie on top"
        game.countdownTimer = 60;
        nextRoundButton.hidden = true;
        disableAllButtons()
        timerLabel.hidden = false;
        getFacts()
        displayFacts()
        startTimer()
    }
   
}


