//
//  HomeV.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class HomeV: UIView {
    @IBOutlet weak var webView: UIWebView!
    
    func loadRequest() {
        webView.scrollView.bounces = false
        webView.dataDetectorTypes = []
        let fileName: String = "index"
        let filePath: String = Bundle.main.path(forResource: fileName, ofType: "html")!
        let url = NSURL(string: filePath)!
        let urlRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(urlRequest as URLRequest)
    }
}
