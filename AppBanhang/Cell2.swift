//
//  Cell2.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/20/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
class Cell2:BaseTableViewCell {
    let imgView:UIImageView = {
    let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    override func setup() {
        addSubview(imgView)
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 1).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
   //     imgView.image = UIImage(named: "006")
        
        
    }
    
}
