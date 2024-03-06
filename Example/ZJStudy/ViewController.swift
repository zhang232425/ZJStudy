//
//  ViewController.swift
//  ZJStudy
//
//  Created by yonathan on 03/05/2024.
//  Copyright (c) 2024 yonathan. All rights reserved.
//

import UIKit
import ZJRoutableTargets
import ZJExtension

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var controllers = [UIViewController]()
        
        if let vc = ZJStudyRoutableTarget.grammar.viewController {
            vc.tabBarItem = .init(title: "Grammar", image: UIImage(color: .blue, size: .init(width: 10, height: 10)), tag: 0)
            controllers.append(UINavigationController(rootViewController: vc))
        }
        
        if let vc = ZJStudyRoutableTarget.scheme.viewController {
            vc.tabBarItem = .init(title: "Scheme", image: UIImage(color: .blue, size: .init(width: 10, height: 10)), tag: 0)
            controllers.append(UINavigationController(rootViewController: vc))
        }
        
        if let vc = ZJStudyRoutableTarget.function.viewController {
            vc.tabBarItem = .init(title: "Function", image: UIImage(color: .blue, size: .init(width: 10, height: 10)), tag: 0)
            controllers.append(UINavigationController(rootViewController: vc))
        }
        
        if let vc = ZJStudyRoutableTarget.algorithm.viewController {
            vc.tabBarItem = .init(title: "Algorithm", image: UIImage(color: .blue, size: .init(width: 10, height: 10)), tag: 0)
            controllers.append(UINavigationController(rootViewController: vc))
        }
        
        viewControllers = controllers
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

