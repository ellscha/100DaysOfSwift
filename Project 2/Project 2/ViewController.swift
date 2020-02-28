//
//  ViewController.swift
//  Project 2
//
//  Created by ELLI SCHARLIN on 2/27/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var roundLLabel: UIBarButtonItem!
    @IBOutlet var scoreLabel: UIBarButtonItem!
    // Country/Flag Array
    var countries = [String]()
    // User's score.
    var score = 0
    // Int that will represet the correct answer of the three flags shown.
    var correctAnswer = 0
    
    var round = 0
    let maxRound = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.isEnabled = false
        roundLLabel.isEnabled = false
        
        scoreLabel.title = "0"
        roundLLabel.title = "1 of \(maxRound)"
        // Add countries to countries array
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        askQuestion()
    }

    // A function to show random flags on the screen

    func askQuestion(action: UIAlertAction! = nil) {
        // Increate Round Number
        // Shuffle the array
        countries.shuffle()
        // Random Int between 0 and 2 to represent correct flag.
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        round += 1
        
        scoreLabel.title = "\(score)" ?? "0"
       
        roundLLabel.title = "\(round) of \(maxRound)"
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if round == maxRound {
            gameOver()
        } else {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that was the flag for \(countries[sender.tag].capitalized)"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)}
    }
    
    func gameOver() {
        let alertController = UIAlertController(title: "Game is Over!", message: "Your score is \(score).", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default, handler: resetGame))
        alertController.addAction(UIAlertAction(title: "Done Playing", style: .default))
        present(alertController, animated: true)
    }
    
    func resetGame(_ : UIAlertAction! = nil) {
        score = 0
        round = 0
        askQuestion()
    }

}
