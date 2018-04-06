//
//  EventsWebViewController.swift
//  TGK
//
//  Created by Jay Park on 4/3/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit
import WebKit

class EventsWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "https://thegivingkitchen.org/events-calendar") {
            self.webView.load(URLRequest(url: url))
        }
    }

}
