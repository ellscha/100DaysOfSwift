//
//  ViewController.swift
//  100DaysProject1
//
//  Created by ELLI SCHARLIN on 2/27/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // Pictures is an array containing the pictures we will be displaying, will be populated in ViewDidLoad().
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the title of the view
        title = "Storm Viewer"
        // Change the text size of the navigation bar.
        navigationController?.navigationBar.prefersLargeTitles = true

        
        //  Set-up the file manager and path to access the images
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Loop to check that item begins with prefix nssl and then append it to pictures array.
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        pictures = pictures.sorted()
        // Do any additional setup after loading the view.
    }
    
    // Setup Tableview with section number
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Setup Tableview with number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    // Configure the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Image \(indexPath.row + 1) of \(pictures.count)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If possible, create a View Controller that has type DetailViewController and if it works, set the image view to display the image we selected from the tableView.
        if let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            detailVC.selectedImage = pictures[indexPath.row]
            
            // A written segue with push type embedded in the Navigation Controller.
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}

