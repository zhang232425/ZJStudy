//
//  ZJBasePartVCViewController.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/7.
//

import UIKit

class ZJBasePartVC: ZJBaseVC {
    
    private lazy var testBtn = UIButton(type: .system).then {
        $0.setTitle("开始测试", for: .normal)
        $0.addTarget(self, action: #selector(testClick), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension ZJBasePartVC {
    
    func setupViews() {
        
        testBtn.add(to: view).snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(50)
        }
        
    }
    
    @objc func testClick() {
        
        
        
    }
    
}
