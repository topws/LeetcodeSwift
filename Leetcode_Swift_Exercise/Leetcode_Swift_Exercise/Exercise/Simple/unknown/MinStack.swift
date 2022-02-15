//
//  MinStack.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/12.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 栈设计：要求查询最小值时，使用常数级时间
 */

/// 只使用一个 额外空间实现查询常数
/// 额外空间存储当前的最小值。栈中不能存原值，得要存储上一次的最小值与当前元素的差值
class MinStack {
    
    var arr: [Int] = []
    var currentMin = 0
    init() {
        
    }
    
    func push(_ val: Int) {
        if arr.count == 0 {
            currentMin = val
            arr.append(0)
        } else {
            // 栈中已有值了
            let diff = val - currentMin
            arr.append(diff)
            if diff < 0 {
                // 最小值更新
                currentMin = val
            }
        }
    }
    
    func pop() {
        
        let diff = arr.removeLast()
        if diff < 0 {
            // 把之前的最小值更新回去
            currentMin = currentMin - diff
        }
    }
    
    func top() -> Int {
        let diff = arr.last!
        if diff >= 0 {
            return diff + currentMin
        } else {
            return currentMin
        }
    }
    
    func min() -> Int {
        return currentMin
    }
}
/// 使用一个辅助栈来实现：
/*
class MinStack {
    
    var arr: [Int] = []
    var helperArr: [Int] = []
    init() {
        
    }
    
    func push(_ val: Int) {
        if helperArr.count == 0 {
            helperArr.append(val)
        } else {
            let currentMin = helperArr.last!
            helperArr.append(min(currentMin, val))
        }
        arr.append(val)
    }
    
    func pop() {
        arr.removeLast()
        helperArr.removeLast()
    }
    
    func top() -> Int {
        guard let last = arr.last else {
            return -1
        }
        return last
    }
    
    func getMin() -> Int {
        if helperArr.count == 0 {
            return -1
        }
        return helperArr.last!
    }
}
*/
