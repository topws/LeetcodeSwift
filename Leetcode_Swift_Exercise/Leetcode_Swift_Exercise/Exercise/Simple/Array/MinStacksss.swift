//
//  MinStack.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/2.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class MinStacksss {

    /** initialize your data structure here. */
    init() {

    }
    
    var arr: [Int64] = []
    var minValue: Int64 = 0
    // 存差值+一个最小值的值
    // MIN - TRUE
    func push(_ x: Int) {
        let x = Int64(x)
        if arr.count == 0 {
            arr.append(0)
            minValue = x
        } else {
            let offset = minValue - x
            arr.append(offset)
            if offset >= 0 {
                minValue = x
            }
        }
    }
    
    func pop() {
        if arr.count == 0 {
            return
        }
        let offset = arr.removeLast()
        if offset == 0 {
            return
        } else if offset > 0 {
            // offset 大于0，存入的数比当时min 还小
            minValue = minValue + offset
        } else {
            // offset 小于0，存入的数比当时min 大
            return
        }
    }
    
    func top() -> Int {
        if arr.count == 0 {
            return -1
        }
        let offset = arr.last!
        if offset == 0 {
            return Int(minValue)
        } else if offset > 0 {
            // offset 大于0，存入的数比当时min 还小
            return Int(minValue)
            
        } else {
            // offset 小于0，存入的数比当时min 大
            return Int(minValue - offset)
        }
    }
    
    func min() -> Int {
        return Int(minValue)
    }
}
