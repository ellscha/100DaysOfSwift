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
                print("after allWords is populated", allWords.count)
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }

        startGame()
    }
    
    // Game start function pick a random word as the word to play and then clear the used words array and then reload the table.
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }

}

