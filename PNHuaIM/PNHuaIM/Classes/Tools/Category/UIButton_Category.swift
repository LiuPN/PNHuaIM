//
//  UIButton_Category.swift
//  PNHuaIM
//
//  Created by 刘攀妞 on 2019/4/12.
//  Copyright © 2019年 刘攀妞. All rights reserved.
//

import UIKit
extension UIButton{
    /** 便利构造函数
     0 便利构造函数通常都是卸载extension里面
     1 加上convenience
     2 没有返回值
     3 加上self.init()
    */
    convenience init(imageName: String, bgImageName: String) {
        self.init()
        
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlight"), for: .highlighted)
        
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        sizeToFit()
        
    }
}
