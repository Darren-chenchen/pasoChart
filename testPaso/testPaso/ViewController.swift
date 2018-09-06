//
//  ViewController.swift
//  testPaso
//
//  Created by darren on 2018/9/5.
//  Copyright © 2018年 陈亮陈亮. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webview: WKWebView = {
        let web = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.webview)
                
        let path = Bundle.main.path(forResource: "index", ofType:"html", inDirectory:"dist") ?? ""
        let url = URL.init(fileURLWithPath: path)
        let request = URLRequest.init(url: url)
        self.webview.load(request)
    }
}

