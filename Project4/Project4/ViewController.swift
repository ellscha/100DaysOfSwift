//
//  ViewController.swift
//  Project4
//
//  Created by ELLI SCHARLIN on 3/1/20.
//  Copyright © 2020 ELLI SCHARLIN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    // a progress view toolbar
    var progressView: UIProgressView!

    var websites: [String] = []
    var websiteClicked = ""

    // We want to configure the view when loading (before view did load).
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting of a Key value observer which will add functionality to the progress bar eventually
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        // Add a bar button to allow for alert controller
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward)), UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))]
        
        // Setting up the progress bar
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // Setting up the toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        // A link to my github page. I can use the `!` because I know this site it input correctly and exists.
        let url = URL(string: "https://" + websiteClicked)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    
    // Finishing setup of Kew value observer for key "estimatedProgress"
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        // if the website you are trying to go to contains the same path as one in our list,
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
}

