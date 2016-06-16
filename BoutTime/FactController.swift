//
//  QuestionController.swift
//  BoutTime
//
//  Created by Keith on 6/10/16.
//  Copyright © 2016 Keith. All rights reserved.
//

import Foundation
import GameKit

var factSet = [Fact]()

enum FileError: ErrorType{
    case InvalidResource
    case ConvertionError
    case InvaildKey
}

class PlistConverter {
    class func dictionaryFromFile (resource: String, ofType type: String) throws -> [Fact]
    {
        var data = [Fact]()
        guard let path = NSBundle.mainBundle().pathForResource(resource, ofType: type) else {
            throw FileError.InvalidResource
        }
        
        
        guard let movieArray = NSMutableArray(contentsOfFile: path)else {
            throw FileError.ConvertionError
        }
        
        for i in 0..<movieArray.count {
            guard let title = movieArray[i].objectForKey("title"),
                let year = movieArray[i].objectForKey("year"),
                let source = movieArray[i].objectForKey("source")else{
                    throw FileError.InvaildKey
            }
            let movie = Fact(fact: title as! String, date: year, source: source as! String)
            data.append(movie)
        }
        
        return data
    }
}


func loadFacts() -> [Fact] {
    
    print("called 1")
    
    do{
        let factList = try PlistConverter.dictionaryFromFile("MovieList", ofType: "plist")
        return factList
    }
    catch let error {
        fatalError("\(error)")
    }
    
}


func getFacts () -> [Fact]
{
    factSet = [Fact]()
    var numbersArray = [Int]()
    var number : Int
    
    
    for _ in 0..<game.maxFacts{
        
        repeat {
        number = GKRandomSource.sharedRandom().nextIntWithUpperBound(facts.count)
        } while numbersArray.contains(number)
        
        numbersArray.append(number)
        factSet.append(facts[number])
        
    }
    
    
    return factSet;
}

let up_full_arrow_selected: UIImage = UIImage(imageLiteral: "up_full_selected.png")
let up_arrow_selected: UIImage = UIImage(imageLiteral: "up_half_selected.png")
let down_full_arrow_selected: UIImage = UIImage(imageLiteral: "down_full_selected.png")
let down_arrow_selected: UIImage = UIImage(imageLiteral: "down_half_selected.png")
let correctAnswersImage: UIImage = UIImage(imageLiteral: "next_round_success.png")
let wrongAnswersImage: UIImage = UIImage(imageLiteral: "next_round_fail.png")
