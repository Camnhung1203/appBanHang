//
//  Cell1.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/20/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit
// TẠO CLASS ĐỂ QUẢN TRỊ CHO TABLEVIEW (có thể tạo từ file swift riêng, code tay thì dùng init bên dưới.
class Cell: BaseTableViewCell{
    // thêm label trong code, bỏ vô chỗ class của Cell
    let lblKH:UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        lbl.textAlignment = .center
        // auto layout cho label co giãn theo số chữ trong đó: bước 1 cho numberOfLines = 0, bước 2 vô override init set leftAnchor greaterThan như bên dưới. Bước 3: neo dưới đáy hoặc ở top. Bước 4: gõ 2 dòng lệnh ở table view để xoá kích thước mặc định của table.
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    override func setup() {
        super.setup()
            //--> nó sẽ dùng background mầu đỏ trong hàm set up bên BaseTableViewCell
       // backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        // auto layout cho label:
        self.addSubview(lblKH)
        lblKH.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lblKH.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //bước 2 của set label co giãn theo số chữ trong đó
        lblKH.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        // set kích thước tối thiểu cho label
        lblKH.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        // neo dưới bottom
        lblKH.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

    }
   }
