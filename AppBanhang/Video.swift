//
//  Video.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/27/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import Foundation

struct Video:BaseModel {
    var id:String
//    var idVideo:String
    var tenVideo:String
    var tenkhongdauVideo:String
    var linkVideo:String
    init(){
        id = ""
        tenVideo = ""
        tenkhongdauVideo = ""
        linkVideo = ""
    }
    init(object:Any){
        if let dic = object as? Dictionary<String,AnyObject>{
            if let id = dic["idVideo"] as? String{
               self.id = id
            }else{
                id = ""
            }
            if let ten = dic["ten"] as? String{
                self.tenVideo = ten
            }else{
                tenVideo = ""
            }
            if let tenkd = dic["ten_khongdau"] as? String{
                self.tenkhongdauVideo = tenkd
            }else{
                tenkhongdauVideo = ""
            }
            if let link = dic["linkHinh"] as? String{
                self.linkVideo = link
            }else{
                linkVideo = ""
            }
    }else{
            id = ""
            tenVideo = ""
            tenkhongdauVideo = ""
            linkVideo = ""
    }
}
}
