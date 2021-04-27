//
//  CustTabBarVC.swift
//  cloudclass
//自定义的UITabBarController，主要是整个工程不允许随重力转屏，但是对于视频播放的界面，又需要能实现全屏的效果。所以目前对于整个工程的配置info中，设置为允许全屏Landscape_right。对于多页签的界面，需要直接采用当前的tabBarController
//  Created by jacty on 16/4/19.
//  Copyright © 2016年 accfun. All rights reserved.
//

import Foundation

@objc open class CustTabBarVC: UITabBarController {
    
    var imageView : UIImageView?
    
    open override var shouldAutorotate : Bool {
        return false
    }
    
    open override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        var attr = NSDictionary(object: UIColor.red, forKey: NSAttributedString.Key.foregroundColor as NSCopying)
        UITabBarItem.appearance().setTitleTextAttributes(attr as? [NSAttributedString.Key : Any], for: UIControl.State.selected)
        attr = NSDictionary(object: UIColor.lightGray, forKey: NSAttributedString.Key.foregroundColor as NSCopying)
        UITabBarItem.appearance().setTitleTextAttributes(attr as? [NSAttributedString.Key : Any], for: UIControl.State.normal)
        
    }
    
    func initTabBarState() {
        // 初始化底部页签的状态
        let uis = self.customizableViewControllers
        for (i,ui) in uis!.enumerated() {
            let tabBar = ui.tabBarItem
            tabBar?.tag = i
            switch i {
            case 0:
                tabBar?.image = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.title = "现场"
                break
            case 1:
                tabBar?.image = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.title = "礼库"
                break
            case 3:
                tabBar?.image = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.title = "亲友团"
                break
            case 4:
                tabBar?.image = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.selectedImage = UIImage(named: "tab_home_select")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tabBar?.title = "婚礼请帖"
                break
            default:
                break;
            }
        }

    }
        
   
   
    
    @objc open func customTabBarItem() {
        
        initTabBarState()
       
        let AppWidth = UIScreen.main.bounds.size.width
        //首先，先覆盖底部
        
        let bgImg = UIView()
        bgImg.frame = self.tabBar.bounds;
        bgImg.backgroundColor = .white
        bgImg.isUserInteractionEnabled = false
        self.tabBar.addSubview(bgImg)
        self.tabBar.sendSubviewToBack(bgImg)
        imageView = UIImageView(image: UIImage(named: "tab_scan"))
        imageView?.center = CGPoint(x: AppWidth/2, y: 69/4.5)
        imageView?.bounds = CGRect(x: 0, y: 0, width: 90, height: 69)
        self.tabBar.addSubview(imageView!)

    }
    
    @objc func btnclicked() {
        self.selectedIndex = 2
        imageView?.image = UIImage(named: "tab_scan")
    }
    
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if imageView != nil {
//            if item.tag != 1 {
                imageView?.image = UIImage(named: "tab_scan")
//            }
        }
    }
    
        
}

