//
//  HangmanGame.swift
//  Hangman
//
//  Created by Sunbin Kim on 2/18/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    //have all my functions in HangmanPhrases
//    let hangmanphrases : HangmanPhrases!
//    var random_phrase: String?
//    var completePhrase: String?
//    var wrong: Array<Character>?
//
//    init() {
//        hangmanphrases = HangmanPhrases()
//    }
//    var already_done = false
////    var completePhrase = [Character]()
////    var correctSet = Set<Character>()
////    var wrong = [Character]()
////    var random_phrase = ""
////    var already_done = false
//
//    func checkCorrect(_ char: Character) {
//        if hangmanphrases.correctSet.contains(char) && random_phrase!.contains(char) {
//            hangmanphrases.correctSet.remove(char)
//            completePhrase!.append(char)
//        } else if !hangmanphrases.correctSet.contains(char) && random_phrase!.contains(char) {
//            already_done = true
//        } else {
//            wrong!.append(char)
//        }
//    }
//
//    func win() -> Bool {
//        if hangmanphrases.correctSet.count == 0 {
//            return true
//        }
//        return false
//    }
//
//    func lose() -> Bool {
//        if wrong!.count < 6 {
//            return false
//        }
//        return true
//    }
//
//    func makeChange() -> String {
//        var current = ""
//        for char in random_phrase! {
//            if !hangmanphrases.correctSet.contains(char) {
//                current += String(char) + " "
//            } else if char == " " {
//                current += "  "
//            } else {
//                current += "_ "
//            }
//        }
//        return current
//    }
}
