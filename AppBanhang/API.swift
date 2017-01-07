//
//  API.swift
//  AppBanhang
//
//  Created by Cam Nhung on 1/3/17.
//  Copyright © 2017 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
enum API:String{
    case PostImage = "iosuploadImage.php"
    case getSP = "GETSP.php"
    case dataJson = "data.json"
    case getCata = "Cata.php"
    case postImage = "PostImage.php"
    var fullLink:String{
        return "http://hidaccademy.com" + self.rawValue
    }
}
