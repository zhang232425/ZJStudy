//
//  ZJHighLevelFunctionVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/19.
//

import UIKit

// Swift 集合类高阶函数
// https://www.jianshu.com/p/984102e89eba

class ZJHighLevelFunctionVC: ZJBaseVC {
    
    private lazy var testBtn = UIButton(type: .system).then {
        $0.setTitle("开始测试", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

private extension ZJHighLevelFunctionVC {
    
    func setupViews() {
        
        testBtn.add(to: view).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}
