//
//  BrokenArray.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/9.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给你一个整数数组 nums ，设计算法来打乱一个没有重复元素的数组。

 实现 Solution class:

 Solution(int[] nums) 使用整数数组 nums 初始化对象
 int[] reset() 重设数组到它的初始状态并返回
 int[] shuffle() 返回数组随机打乱后的结果

 */
class BrokenArray {
    
    var source: [Int] = []
    init(_ nums: [Int]) {
        source = nums
    }
    
    func reset() -> [Int] {
        
        return source
    }
    
    func shuffle() -> [Int] {
        // 每个元素的位置是随机的，搞一个下标数组，不断取值
        var indexArr: [Int] = []
        for index in 0..<source.count {
            indexArr.append(index)
        }
        var res:[Int] = []
        for _ in 0..<source.count {
            let range = Range.init(NSMakeRange(0, indexArr.count))!
            let random = Int.random(in: range)
            let currentIndex = indexArr.remove(at: random)
            res.append(source[currentIndex])
        }
        
        return res
    }
}
