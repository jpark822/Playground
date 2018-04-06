//
//  WebKitViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString:String! {
        didSet {
            self.loadWebView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.largeTitleDisplayMode = .always
        self.loadWebView()
    }
    
    func loadWebView() {
        guard self.isViewLoaded else {
            return
        }
        
        if let url = URL(string: self.urlString) {
            let urlRequest = URLRequest(url: url)
            self.webView.load(urlRequest)
        }
    }

}
