//
//  BaseViewController.swift
//  AppBanhang
//
//  Created by Cam Nhung on 1/3/17.
//  Copyright © 2017 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
class BAseViewController:UIViewController{
    //Do có một số hàm không chạy được trong view didload
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    func setup(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    let imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
}
