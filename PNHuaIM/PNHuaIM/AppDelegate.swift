//
//  AppDelegate.swift
//  PNHuaIM
//
//  Created by 刘攀妞 on 2019/4/9.
//  Copyright © 2019年 刘攀妞. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor(red: 64.0/255.0, green: 164.0/255.0, blue: 64.0/255.0, alpha: 1)
        
        // 创建window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PNMainViewController();

        window?.makeKeyAndVisible()
        
        return true
    }

    

}

