//
//  DetailViewController.swift
//  100DaysProject1
//
//  Created by ELLI SCHARLIN on 2/27/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    // To be passed in from TableViewController
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the page title to the selected image name.
        title = selectedImage
        // Add a button to the navigation controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        // We set the navigation bar title size in the other view controller but don't want it to be large in this one.
        navigationItem.largeTitleDisplayMode = .never
        
        // Check to see if string was passed through
        if let imageName = selectedImage {
        // Setup the image using the string passed through from the selected row.
            imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
        }
    }
    
    // Using ViewWillAppear to hide navigation bar on tap
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    // Share Tapped function for Activity View Controller
    @objc func shareTapped() {
        // Make sure there is a photo (jpeg) that is sendable, otherwise print message.
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image Found")
            return
        }
        
        // Set up the activity view and its attributes.
        let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }

}
