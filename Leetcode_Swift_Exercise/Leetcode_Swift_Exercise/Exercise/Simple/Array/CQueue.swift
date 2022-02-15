//
//  CQueue.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/2.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class CQueue {
    
    init() {
        
    }
    
    var arr: [Int] = []
    
    func appendTail(_ value: Int) {
        arr.append(value)
    }
    
    func deleteHead() -> Int {
        if arr.count == 0 {
            return -1
        }
        return arr.removeFirst()
    }
    
    // 定义两个栈
    // A 栈 支持插入，每需要末尾追加时，直接推入A 中
    // B 栈 支持删除，每需要删除时，判断B是否有元素，没有就把A 栈中的元素全部倒入B 栈，然后删除栈顶，如果A中也没有元素，返回-1
}
