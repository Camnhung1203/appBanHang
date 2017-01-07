//
//  ViewController04.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/15/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import UIKit

class ViewController04: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController04.huy), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    // func này sẽ chuyển về lại màn hình đã gọi nó ra
    func huy(){
        // * Lắc qua trái, phải:
//        let lac1 = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
//        let lac2 = CATransform3DTranslate(lac1, -300, 0, 0)
        
        //* Lắc phóng to thu nhỏ:
//        let lac1 = CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0.2)
//        let lac2 = CATransform3DScale(lac1, 3, 3, 3)
        
        //* ghép các hiệu ứng đơn lại
        let lac1 = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
        let lac2 = CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0.2)
        let lac3 =  CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 0, 1, 0)
        let tonghop = CATransform3DConcat(lac2, lac3)
        
        // cho hiệu ứng mờ dần, xoay rồi biến mất:
        //M_PI: quay 180
        // xoay tròn: cho z = 0, x & y = 1, (0, 1, 0: quay theo trục y)
        UIView.animate(withDuration: 1, animations: {
            
            //            self.view.alpha = 0
            //        self.view.layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 0, 1, 0)
            //        self.dismiss(animated: true, completion: nil)
            //            })
            // tạo hiệu ứng lắc:
            self.imgview.layer.transform = lac1
        }, completion: {(true) in
            
            UIView.animate(withDuration: 3, animations: {
                self.imgview.layer.transform = tonghop
                
            }, completion: {(true) in
                UIView.animate(withDuration: 1, animations: {self.imgview.layer.transform = CATransform3DIdentity
                    self.imgview.alpha = 0}, completion: {(true) in
                        self.dismiss(animated: true, completion: nil)
                })
            })
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
