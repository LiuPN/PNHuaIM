//
//  UIButton_category.swift
//  PNHuaIM
//
//  Created by 刘攀妞 on 2019/4/12.
//  Copyright © 2019年 刘攀妞. All rights reserved.
//

import UIKit
extension UIButton{
    
   convenience init(imageName: String , bgImageName: String){
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
    
        setBackgroundImage(UIImage(named: imageName), for: .normal)
        setBackgroundImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
    
        sizeToFit()
    }
}
