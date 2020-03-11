//
//  ViewController.swift
//  Project5
//
//  Created by ELLI SCHARLIN on 3/6/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // Word Arrays to load throughout the game.
    var allWords = [String]()
    var usedWords = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // Try ? and return nil if there is an area.
            if let startWords = try? String(contentsOf: startWordsURL) {
                // use the contents of startWords to populate the allWords array.
                // The \n character is the new-line character
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        // Do any additional setup after loading the view.
    }


}

