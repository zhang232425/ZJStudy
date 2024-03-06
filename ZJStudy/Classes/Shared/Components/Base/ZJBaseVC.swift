//
//  ZJBaseVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit

class ZJBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
}

private extension ZJBaseVC {
    
    func config() {
        view.backgroundColor = .white
    }
    
}
