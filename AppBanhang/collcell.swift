//
//  collcell.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/22/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation
import UIKit

class collcell1:BaseCollCell{
    lazy var collView1:UICollectionView = {
        // set cho scroll theo chiều ngang thì đặt biến layout = UICollectionViewFlowLayout(), rồi layout.scrollDirection = .horizontal, còn không mặc định nó scroll theo chiều dọc.
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let c:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.register(CollCell2.self, forCellWithReuseIdentifier: "Coll2")
        c.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        c.delegate = self
        c.dataSource = self
        return c
    }()
    func setupColl(){
        addSubview(collView1)
        addContrainWithVS(format: "V:|[v0]|", views: collView1)
        addContrainWithVS(format: "H:|[v0]|", views: collView1)
        
    }
    
    override func setup() {
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        setupColl()
    }
    var listvideo:Array<Video> = []
    
}


extension collcell1:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listvideo.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll2", for: indexPath) as! CollCell2
        cell.video = listvideo[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.height - 20, height: frame.size.height - 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("da nhan man hinh xanh")
        //Chuyển hành động qua viewcontroller:
        NotificationCenter.default.post(name: NSNotification.Name.init("clickbluecell"), object: listvideo[indexPath.row])
        
        //bài tập: nhấn chuyển qua màn hình mới
    }
}
