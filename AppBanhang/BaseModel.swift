//
//  BaseModel.swift
//  AppBanhang
//
//  Created by Cam Nhung on 1/3/17.
//  Copyright © 2017 Cam Nhung. All rights reserved.
//


import Foundation
import UIKit

protocol BaseModel {
    var id:String{get set}
    init(object:Any)
    }
