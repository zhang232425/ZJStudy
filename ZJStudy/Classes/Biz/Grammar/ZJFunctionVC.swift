//
//  ZJFunctionVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit
import RxCocoa

// https://blog.csdn.net/u013480070/category_9863471.html （Swift底层原理）

class ZJFunctionVC: ZJBaseVC {
    
    private lazy var testBtn = UIButton(type: .system).then {
        $0.setTitle("开始测试", for: .normal)
        $0.addTarget(self, action: #selector(testClick), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

private extension ZJFunctionVC {
    
    func setupViews() {
        
        testBtn.add(to: view).snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(50)
        }
        
    }
    
    @objc func testClick() {
        
        print(greet(person: "王滕"))
        
        print(greetAgain(person: "陈铭"))
        
        print(greet(person: "王滕", alreadyGreeted: true))
        
        print(sayHelloWorld())
        
        let _ = printAndCount(string: "zhangdachun")
        
        let bounds = minMax(array: [8, -7, 2, 109, 3, 71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        
        if let boundss = maxMin(array: [8, -100, 1000, 2, 21]) {
            print("max = \(boundss.max), min = \(boundss.min)")
        }

        print(greet(person: "Bill", from: "Cupertino"))
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt = \(someInt), anotherInt = \(anotherInt)")
        
        // 定义一个函数类型
        // var mathFunction: (Int, Int) -> Int = addTwoInts
        var mathFunction: (Int, Int) -> Int = addTwoInts
        
        print("Result: \(mathFunction(2, 3))")
        
        mathFunction = multiplyTwoInts(_:_:)
        
        print("Result: \(mathFunction(2, 3))")
        
        let printFunction = printHelloWorld
        printFunction()
        
        printMathResult(addTwoInts, 13, 13)
        
        // 函数作为返回类型
        var currentValue = -5
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        print("Counting to zero:")
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        
    }
    

}

private extension ZJFunctionVC {
    
    // 1.函数的定义与调用
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    
    // 2.无参数函数
    func sayHelloWorld() -> String {
        return "hello world"
    }
    
    // 3.多参数类型
    func greet(person: String, alreadyGreeted: Bool) -> String {
        // 隐式返回的函数
        alreadyGreeted ? greetAgain(person: person) : greet(person: person)
    }
    
    func printAndCount(string: String) -> Int {
        print(string)
        return string.count
    }
    
    // 4.多重返回值函数
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[1]
        for value in array[1 ..< array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    func maxMin(array: [Int]) -> (max: Int, min: Int)? {
        if array.isEmpty { return nil }
        var currentMax = array[0]
        var currentMin = array[0]
        for value in array[1 ..< array.count] {
            if value > currentMax {
                currentMax = value
            } else if value < currentMin {
                currentMin = value
            }
        }
        return (currentMax, currentMin)
    }
    
    /**
     每一个函数参数都有一个参数标签（argument label）以及一个参数名称（parameter name）。参数标签在调用函数的时候使用，调用的时候需要将参数标签写在对应的实参前面。参数名在函数的实现中使用
     默认情况下，函数参数用参数名称来作为它们的参数标签
     */
    
    // 5.函数的参数标签和参数名称 (忽略参数标签)（默认参数 deafult value 放后面）
    func someFunction(_ firstParameterName: Int, secondParameterName: Int = 13) {
        
    }
    
    func someFunction(argumentLabel parameterName: Int) {
        
    }
    
    func greet(person: String, from hometown: String) -> String {
        "Hello \(person) ! Glad you could visit from \(hometown)."
    }
    
    // 可变参数
    func arithmeticMean(_ numbers: Double..., counts: Int...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    // 6.输入输出参数 (inout原理)
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    // 7.函数类型：函数类型是由函数的参数类型和返回类型组成
    // 函数类型：(Int, Int) -> Int
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        a * b
    }
    
    // 函数类型：() -> Void
    func printHelloWorld() {
        print("Hello world")
    }
    
    // 8.函数类型作为参数类型
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    
    // 9.函数作为返回类型
    /*
    func stepForword(_ input: Int) -> Int {
        input + 1
    }
    
    func stepBackword(_ input: Int) -> Int {
        input - 1
    }
    
    func chooseStepFunction(backword: Bool) -> (Int) -> Int {
        backword ? stepBackword : stepForword
    }
     */
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { input + 1 }
        func stepBackward(input: Int) -> Int { input - 1 }
        return backward ? stepBackward : stepForward
    }
    
}

/// 扩展
/**
 结构体、类可以定义存储属性（类似成员变量）、计算属性
 枚举不可以定义存储属性？：因为枚举实例中要么存储原始值，要么存储关联值，没有位置放存储属性
 输入输出参数：inout原理
 */

