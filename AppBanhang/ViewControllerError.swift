//
//  ViewControllerError.swift
//  AppBanhang
//
//  Created by Cam Nhung on 1/3/17.
//  Copyright © 2017 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
class ViewControllerError: BAseViewController {
override func viewDidLoad(){
    super.setup()
    imageView.image = UIImage(named: "error")
    view.addSubview(imageView)
    view.addContrainWithVS(format: "H:|[v0]|", views: imageView)
    view.addContrainWithVS(format: "V:|[v0]|", views: imageView)
}

}
