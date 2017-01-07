//
//  Method.swift
//  AppBanhang
//
//  Created by Cam Nhung on 1/3/17.
//  Copyright © 2017 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
enum Method:String {
   case get = "GET"
    case post = "POST"
    var toString:String{
        return self.rawValue
    }
}
