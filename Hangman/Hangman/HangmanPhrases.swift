//
//  HangmanPhrases.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import Foundation

class HangmanPhrases {
//    let game : HangmanGame!
    var phrases : NSArray!
//    let game = HangmanGame()
    
    // Initialize HangmanPhrase with an array of all possible phrases of the Hangman game
    init() {
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
    // Get random phrase from all available phrases.
    // Ah, noticed the weird `@objc dynamic` prefix?
    // You can (and should) ignore that for now. But if you're curious, `@objc` exposes the Swift method
    // to the Objective-C runtime, whereas the `dynamic` keyword tells the Swift runtime to use dynamic
    // dispatch instead of static (e.g. These keywords are necessary for the autograder to work).
    @objc dynamic func getRandomPhrase() -> String {
        let index = Int(arc4random_uniform(UInt32(phrases.count)))
        return phrases.object(at: index) as! String
    }
    
    //new variables
    var correctSet = Set<Character>()
    var completePhrase = [Character]()
    var wrong = [Character]()
    var random_phrase = ""
    var already_done = false
    
    func init_new() {
        random_phrase = getRandomPhrase()
        var i = 0
        for char in random_phrase {
            if !(char == " ")  && i == 0 {
                correctSet.insert(char)
                i = 1
            } else {
                if !(char == " ") && !correctSet.contains(char) {
                    correctSet.insert(char)
                }
            }
        }
    }
    
    func checkCorrect(_ char: Character) {
        if correctSet.contains(char) && random_phrase.contains(char) {
            correctSet.remove(char)
            completePhrase.append(char)
        } else if !correctSet.contains(char) && random_phrase.contains(char) {
            already_done = true
        } else {
            if(wrong.contains(char)){
                already_done = true
            } else{
                wrong.append(char)
            }
        }
    }

    func win() -> Bool {
        if correctSet.count == 0 {
            return true
        }
        return false
    }

    func lose() -> Bool {
        if wrong.count < 6 {
            return false
        }
        return true
    }

    func makeChange() -> String {
        var current = ""
        for char in random_phrase {
            if !correctSet.contains(char) {
                current += String(char) + " "
            } else if char == " " {
                current += "  "
            } else {
                current += "_ "
            }
        }
        return current
    }
}
