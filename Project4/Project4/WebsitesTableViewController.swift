//
//  WebsitesTableViewController.swift
//  Project4
//
//  Created by ELLI SCHARLIN on 3/1/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit

class WebsitesTableViewController: UITableViewController {

    
    // An array of websites that we are okay with the user going to.
    var websites = ["github.com", "apple.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWebsite))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    // Not flawless, you can enter valid format and invalid site, but that's fine for what I was going for.
    @objc func addWebsite() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter a website to visit.", message: nil, preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "url goes here"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if self.verifyUrl(urlString: "https://" + (alert?.textFields![0].text)!) {
                let textFieldText = alert?.textFields![0].text
                // Force unwrapping because we know it exists.
                self.websites.append(textFieldText!)
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: {
            self.tableView.reloadData()
        })
        print(websites.count, [websites])
    }
    
    // To make sure user input is valid url.
    func verifyUrl(urlString: String?) -> Bool {

        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return false
        }

        if UIApplication.shared.canOpenURL(url) && urlString.hasSuffix(".com"){
            return true
        }
        return false
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if let vc = segue.destination as? ViewController {
            vc.websiteClicked = websites[selectedPath.row]
            vc.websites = self.websites
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
