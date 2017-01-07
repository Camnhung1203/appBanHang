//
//  ViewController02.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/15/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {
    let webView:UIWebView = {
        let wb = UIWebView()
        wb.scrollView.isScrollEnabled = false
        wb.translatesAutoresizingMaskIntoConstraints = false
        return wb
    }()
    var video: Video = Video()
    var link: String{
        return "https://www.youtube.com/embed/\(video.id)"
    }
    
    override func viewDidLoad() {
        view.addSubview(webView)
        view.addContrainWithVS(format: "H:|[v0]|", views: webView)
        view.addContrainWithVS(format: "V:|[v0]|", views: webView)
        //idVideo = "rpBx7V3l8ko"
        let url:URL = URL(string: link)!
        let request:URLRequest = URLRequest(url: url)
        webView.loadRequest(request)
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
    }
}
