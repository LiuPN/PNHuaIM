//
//  PNMainViewController.swift
//  PNHuaIM
//
//  Created by 刘攀妞 on 2019/4/9.
//  Copyright © 2019年 刘攀妞. All rights reserved.
//
// App Key : pwe86ga5p4ht6
// App Secret : CFkglYbJlw
// {"code":200,"userId":"PNHualM.cn","token":"GxZFCU5y6xcyDmuB++dGSXp/JIrAkNNRG+VZw8MqQkta06wDje/LeNiE+gyaSLiFNmx57+3T4zaTbyTM4bJJ7u99VU0Vft52"}
// name : LPN

import UIKit

class PNMainViewController: UITabBarController {
    
    // lazy  苹果推荐使用构造函数创建 不适用类方法。类方法也是可以的，只是不提倡
    private lazy var composeBtn: UIButton = UIButton(imageName: "tabbarCenterIcon", bgImageName: "")
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // // i == 1的时候 交互关闭
        for i in 0..<tabBar.items!.count{
            if i == 1{
                let item = tabBar.items![i]
                item.isEnabled = false
                break
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 添加加号按钮
        setUpComposeBtn()

        // 添加子控制器
        setUpChildrenVC()
    
    }
    
    
   
}

/// 设置界面的类扩展
extension PNMainViewController{
    
    private func setUpComposeBtn() -> Void {
        // 1 添加加号按钮
        tabBar.addSubview(composeBtn)
        
        // 2 设置frame
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height * 0.5)
        
        // 3 事件监听
        composeBtn.addTarget(self, action: #selector(PNMainViewController.composeBtnClick) , for: .touchUpInside)
    }
   
    
    
    private func setUpChildrenVC() -> Void {
        // 1 加载json文件  字符串json
        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings", ofType: "json") else{
            print("加载json数据失败")
            return
        }
        // 2 读取json内容
        guard let jsonData = NSData(contentsOfFile: jsonPath) as Data? else{
            print("没有获取到json数据")
            return
        }
        
        // 3 jsonData转为数组
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) else{
            return
        }
        
        // 转数组
        guard let dictArr = anyObject as? [[String : AnyObject]] else{
            return
        }
        
        // 4 遍历字典数组，获取对应的信息
        for dict in dictArr {
            // 4.1 获取控制器对应的字符串
            guard let vcName = dict["vcName"] as? String else{
                continue
            }
            
            // 4.2 获取控制器显示的title
            guard let title = dict["title"] as? String else{
                continue
            }
            
            // 4.3 获取控制器显示的图标名称
            guard let imageName = dict["imageName"] as? String else{
                continue
            }
            // 添加控制器
            addChildViewChild(vcName, title: title, image: imageName)
            
        }
  
    }
    
    
    // private 只能在类中访问  swift有方法的重载（函数名相同，参数类型不同），oc中没有重载的说法
    private func addChildViewChild(_ childVCName: String, title: String, image: String) {
        
        // 0 动态获取命名空间Executable file  强制解包
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{
            print("没有命名空间")
            return
        }
        
        
        // 1 可读性强 AnyClass  拼接命名空间
        guard let childVCClass = NSClassFromString(nameSpace + "." + childVCName) else {
            print("没有获取到字符串对应的class")
            return
        }
        // 2 转成控制器的类型
        guard let childVCType = childVCClass as? UIViewController.Type else{
            print("没有获取对应控制器的类型")
            return;
        }
        
        // 3 创建对应的控制器  swift固定写法
        let childVC = childVCType.init()
        
        // 4 设置属性
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        
        let selImage = UIImage(named: image + "_selected")
        childVC.tabBarItem.selectedImage = selImage
        
        let naviHome = UINavigationController(rootViewController: childVC)
        addChild(naviHome)
    }
    

}
/// 事件监听
extension PNMainViewController{
    @objc private func composeBtnClick(){
        print("composeBtnClick")
    }
}

