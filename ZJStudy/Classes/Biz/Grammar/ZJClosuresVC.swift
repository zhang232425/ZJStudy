//
//  ZJClosuresVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit

class ZJClosuresVC: ZJBaseVC {
    
    private lazy var testBtn = UIButton(type: .system).then {
        $0.setTitle("开始测试", for: .normal)
        $0.addTarget(self, action: #selector(testClick), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension ZJClosuresVC {
    
    func setupViews() {
        
        testBtn.add(to: view).snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(50)
        }
        
    }
    
    @objc func testClick() {
        self.test2()
    }
    
}

private extension ZJClosuresVC {
    
    // https://cloud.tencent.com/developer/article/1828638
    // 1.闭包表达式
    func test1() {
        
        /// 备注：在Swift中可以通过func定义一个函数，也可以通过闭包表达式（Closure Expression）定义一个函数
        /**
         { (parameters) -> return type in
            statements
         }
         */
        
        /*
        let sum = sum(1, 2)
        print("sum = \(sum)")
        
        var fn = { (v1: Int, v2: Int) -> Int in
            return v1 + v2
        }
        let result = fn(1, 2)
        print("result = \(result)")
        */
        
        /// 闭包表达式的简写
        exec(v1: 10, v2: 10, fn: sum)
        
        exec(v1: 10, v2: 20, fn: { (v1: Int, v2: Int) -> Int in
            return v1 + v2
        })
        
        /// 简写1：省略参数类型和返回值
        exec(v1: 10, v2: 30) { v1, v2 in
            return v1 + v2
        }
        
        /// 简写2：如果函数返回值是一个单一表达式，可以省略return
        exec(v1: 10, v2: 40) { v1, v2 in
            v1 + v2
        }
        
        /// 简写3：如果不想写参数，可以美元符号表示
        exec(v1: 10, v2: 50) { $0 + $1 }
        
        /// 简写4：简单的闭包表达式还可以直接用运算符替代
        exec(v1: 10, v2: 60, fn: +)
        
    }
    
    func sum(_ v1: Int, _ v2: Int) -> Int {
        return v1 + v2
    }
    
    /**
     func exec(v1: Int, v2: Int, fn: (Int, Int) -&gt; Int) {
         print(fn(v1, v2))
     }
     */
    func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
        print(fn(v1, v2))
    }
    
    
}

private extension ZJClosuresVC {
    
    // let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    func test2() {
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        // var reversedNames = names.sorted(by: backward)
        var reversedNames = names.sorted(by: backward)
        print("reversedNames = \(reversedNames)")
        
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        
    }
    
    
}
