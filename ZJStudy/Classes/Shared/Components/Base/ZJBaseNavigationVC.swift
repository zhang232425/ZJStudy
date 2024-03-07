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
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
