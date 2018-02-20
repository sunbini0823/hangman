//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Sunbin Kim on 2/17/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit
import AVFoundation

class HangmanViewController: UIViewController {

    var phrase = HangmanPhrases()
//    var game = HangmanGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        phrase.init_new()
        updateWord()
        print(phrase.random_phrase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var inputLetter: UITextField!
    
    @IBAction func pressGuess(_ sender: UIButton) {
        var letter:String = inputLetter.text ?? " "
        inputLetter.text = ""
        if letter.count > 1 {
            let alertController = UIAlertController(title: "ERROR", message:
                "Only one letter at a time", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Back?", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        letter = letter.capitalized
        let char_letter = letter.first ?? " "
//        char_letter = char_letter.capitalized
        phrase.checkCorrect(char_letter)
        if(phrase.already_done) {
            alert_already()
            phrase.already_done = false
        } else{
            updateWord()
            updatewrongGuesses()
            updateImage()
            if phrase.win() {
                endGame(input1: "YAY You won!", input2: "Congratulations😄")
            }
            if phrase.lose() {
                endGame(input1: "Oh no You lost!", input2:"Try again 😜")
            }
        }
    }
    
    @IBOutlet weak var word: UILabel!
    func updateWord(){
        word.text = phrase.makeChange()
    }

    @IBOutlet weak var wrongGuesses: UILabel!
    func updatewrongGuesses() {
        var list = ""
        for char in phrase.wrong {
            list += String(char) + ", "
        }
        self.wrongGuesses.text = list
    }
    func resetwrongGuesses() {
        self.wrongGuesses.text = ""
        phrase.wrong = [Character]()
    }
    
    @IBOutlet weak var image: UIImageView!
    func updateImage() {
        let num = phrase.wrong.count
        if (num <= 6){
            let temp: String = "hangman" + String(num + 1)
             image.image = UIImage(named: temp)
        }
    }
    
    func endGame(input1: String, input2: String){
        let alertController = UIAlertController(title: input1, message:
            input2, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "NEW GAME", style: UIAlertActionStyle.default,handler: reset))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func reset(alert: UIAlertAction!){
        print("NEW GAME. GOOD LUCK! 😉")
        phrase.init_new()
        resetwrongGuesses()
        updateImage()
        updateWord()
    }
    func alert_already(){
        let alertController = UIAlertController(title: "Already Guessed the letter", message:
            "Try another letter", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        phrase.init_new()
        phrase = HangmanPhrases()
        resetwrongGuesses()
        updateImage()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
