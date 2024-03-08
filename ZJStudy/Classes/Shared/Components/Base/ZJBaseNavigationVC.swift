//
//  ZJBaseNavigationVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/7.
//

import UIKit

class ZJBaseNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}

private extension ZJBaseNavigationVC {
    
    func config() {
        
        /***
         iOS 13以上使用UINavigationBarAppearance类来设置
         */
        
        self.navigationBar.isTranslucent = false
        
        /// 1、导航栏背景颜色
        let color = UIColor(hexString: "#F6F8FA")
        let titleStyle = [NSAttributedStringKey.foregroundColor: UIColor.black,
                          NSAttributedStringKey.font: UIFont.medium16]
        if #available(iOS 15.0, *) {
            let apperance = UINavigationBarAppearance()
            apperance.backgroundColor = color
            apperance.titleTextAttributes = titleStyle
            apperance.shadowColor = nil
            self.navigationBar.standardAppearance = apperance
            self.navigationBar.scrollEdgeAppearance = apperance
        } else {
            self.navigationBar.barTintColor = color
            self.navigationBar.titleTextAttributes = titleStyle
        }
        
        /// 导航栏控件颜色
        self.navigationBar.tintColor = UIColor.black
        
    }
    
}
