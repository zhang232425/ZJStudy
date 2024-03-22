//
//  ZJSortVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/19.
//

import UIKit
import RxCocoa

// https://www.cnblogs.com/onepixel/p/7674659.html
// https://www.jianshu.com/p/521a49030280

class ZJSortVC: ZJBaseVC {
    
    private lazy var testBtn = UIButton(type: .system).then {
        $0.setTitle("开始测试", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindActions()
    }

}

private extension ZJSortVC {
    
    func setupViews() {
        
        testBtn.add(to: view).snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(40)
        }
        
    }
    
    func bindActions() {
        
        testBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.testClick()
        }).disposed(by: disposeBag)
        
    }
    
}

private extension ZJSortVC {
    
    func testClick() {
        
        let list = [100, 23, 45, 99, 43, 56, 2, 7, 1, 89, 85, 76, 54, 20, 49]
//        let list = [5, 4, 3, 2, 1]
        let resultList = selectSort(list)
        print("list = ", list)
        if let result = resultList {
            print("result = ", result)
        }
        
    }
    
}

// MARK: - 语法自带的排序方法
private extension ZJSortVC {
    
    /**
     sort函数:
     对原集合进行给定条件排序
     无返回值，直接修改原集合，所以这个集合应该是可变集合
     */
    func sort() {
        
        
        var numbers = [7, 6, 10, 9, 8, 1, 2, 3, 4, 5]
//        numbers.sort { a, b -> Bool in
//            return a < b
//        }
//        numbers.sort { a, b in
//            a > b
//        }
        numbers.sort { $0 < $1 }
//        numbers.sort(by: <)
        print("numbers = ", numbers)
         
        
//        var numbers = [7, 6, 10, 9, 8, 1, 2, 3, 4, 5]
//        numbers.sort()
//        print("numbers = ", numbers)
        
    }
    
    /**
     sorted函数：
     sorted 和 sort 相对
     根据给定的条件排序，返回一个新的集合，不修改原来的集合
     */
    func sorted() {
        
        let numbers = [7, 6, 10, 9, 8, 1, 2, 3, 4, 5]
//        let resultArr = numbers.sorted { a, b -> Bool in
//            return a < b
//        }
        
//        let resultArr = numbers.sorted { a, b in
//            a > b
//        }
        
//        let resultArr = numbers.sorted { $0 < $1 }
        
        let resultArr = numbers.sorted(by: <)
        
        print("numbers = ", numbers)
        print("resultArr = ", resultArr)
        
    }
    
}

// MARK: - 冒泡排序 比较相邻元素，互换位置
private extension ZJSortVC {
    
    /*
    func bubbleSort(_ array: [Int]) -> [Int]? {
        if array.isEmpty {
            return nil
        }
        let count = array.count
        var tempArray = array
        for i in 0 ..< count {
            for j in 0 ..< count - i - 1 {
                if tempArray[j] > tempArray[j + 1] {
                    let temp = tempArray[j]
                    tempArray[j] = tempArray[j + 1]
                    tempArray[j + 1] = temp
                }
            }
        }
        return tempArray
    }
     */
    
    /*
    // 冒泡排序-初级
    func bubbleSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempArray = list
        for i in 0 ..< tempArray.count {
            var j = i + 1
            while j < tempArray.count {
                if tempArray[i] > tempArray[j] {
                    tempArray.swapAt(i, j)
                }
                j += 1
            }
        }
        return tempArray
    }
    */

    /**
     func bubbleSort1(list: inout [Int]) {
         for i in 0..<list.count { // 头部开始遍历
             var j = list.count - 2
             while j >= i { // 遍历从j=倒数第二个元素，到i
                 let a = list[j]
                 let b = list[j + 1]
                 if a > b { // 比较的值是下标j和j+1
                     list.swapAt(j + 1, j)
                 }
                 j -= 1
             }
         }
     }
     */
    
    /*
    // 冒泡排序-正宗
    func bubbleSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempList = list
        for i in 0 ..< tempList.count {
            var j = tempList.count - 2
            while j >= i {
                if tempList[j] > tempList[j + 1] {
                    tempList.swapAt(j + 1, j)
                }
                j -= 1
            }
        }
        return tempList
    }
     */
    
    
     /**
      // 冒泡排序-优化
      func bubbleSort2(list: inout [Int]) {
          var flag = true // 增加一个标志，判断是否已经排序完成。初始化为true。
          for i in 0..<list.count {
              if flag { // 判断flag状态，false状态：说明已经排序完成
                  flag = false // 改变flag状态为false
                  var j = list.count - 2
                  while j >= i {
                      let a = list[j]
                      let b = list[j + 1]
                      if a > b {
                          list.swapAt(j, j+1)
                          flag = true // 有交换，说明排序未完成
                      }
                      j -= 1
                  }
              } else {
                  return
              }
          }
      }
      */
    
    // 冒泡排序-优化
    /*
    func bubbleSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempList = list
        var flag = true
        for i in 0 ..< tempList.count {
            if flag {
                flag = false
                var j = tempList.count - 2
                while j >= i {
                    if tempList[j] > tempList[j + 1] {
                        tempList.swapAt(j, j + 1)
                        flag = true
                    }
                    j -= 1
                }
            }
        }
        return tempList
    }
     */
    
    func bubbleSort(_ list: [Int]) -> [Int]? {
        var tempList = list
        var flag = true
        for i in 0 ..< tempList.count {
            if flag {
                flag = false
                for j in 0 ..< tempList.count - i - 1 {
                    if tempList[j] > tempList[j + 1] {
                        let temp = tempList[j]
                        tempList[j] = tempList[j + 1]
                        tempList[j + 1] = temp
                        flag = true
                    }
                }
            }
        }
        return tempList
    }
    
    
}

// MARK: - 选择排序 选出最大（最小值）放在首位，然后重复操作
private extension ZJSortVC {
    
    /*
    func selectSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempList = list
        var index = 0
        for i in 0 ..< tempList.count {
            index = i
            for j in i + 1 ..< tempList.count {
                if tempList[j] < tempList[index] {
                    index = j
                }
            }
            let temp = tempList[i]
            tempList[i] = tempList[index]
            tempList[index] = temp
        }
        return tempList
    }
     */
    
    func selectSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempList = list
        for i in 0 ..< tempList.count {
            var index = i // 初始当前位置为最小值
            var j = i + 1
            while j < tempList.count { // 便利后续元素，找到最小值的下标
                if tempList[index] > tempList[j] {
                    index = j
                }
                j += 1
            }
            if  index != i {
                tempList.swapAt(i, index)
            }
        }
        return tempList
    }
    
}

// MARKL - 插入排序：将当前便利的元素插入到前面已经排好的序列的指定位置
private extension ZJSortVC {
    
    func insertionSort(_ list: [Int]) -> [Int]? {
        if list.isEmpty { return nil }
        var tempList = list
        for i in 1 ..< tempList.count {
            
        }
        return tempList
    }
    
}


