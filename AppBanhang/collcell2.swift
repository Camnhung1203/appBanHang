//
//  collcell2.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/22/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit

class CollCell2:BaseCollCell{
    let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "007")
        return img
    }()
    let indicator:UIActivityIndicatorView = {
        let indi = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        indi.color = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        indi.translatesAutoresizingMaskIntoConstraints = false
        return indi
        
    }()
   
    var video:Video = Video()
    override func setupSub() {
        imgView.loadImageOnline(link: video.linkVideo)
    }
    override func setup() {
       
        backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        addSubview(imgView)
        
        addContrainWithVS(format: "V:|[v0]|", views: imgView)
        addContrainWithVS(format: "H:|[v0]|", views: imgView)
        
        
    }
}
