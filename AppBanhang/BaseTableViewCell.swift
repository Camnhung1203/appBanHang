//
//  BaseTableViewCell.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/20/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
class BaseTableViewCell:UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    func setup(){
        backgroundColor = #colorLiteral(red: 1, green: 0.09627042073, blue: 0.04339648754, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
