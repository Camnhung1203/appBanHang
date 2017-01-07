//
//  BaseCollCell.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/22/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit

class BaseCollCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
        
    }
    override func layoutSubviews() {
        setupSub()
    }
    func setupSub(){
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
