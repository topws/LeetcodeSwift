//
//  LongestConsecutive.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/11.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class LongestConsecutive {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // 普通方案：sort,然后再遍历一次，确认最大长度
        
        // 题解要求复杂度为o(n),也就是主遍历只能是常数次
        // 最大的特征是连续的，也就是说已经找到的连续串可以移除掉，那么查找的方式就是用n-1,n+1的字典取值方式
        var dict: [Int:Int] = [:]
        for num in nums {
            dict[num] = 1
        }
        
        var result = 0
        while true {
            
            if dict.count == 0 {
                break
            }
            // 开始查找
            var length = 1
            let value = dict.keys.first!
            var up = value
            var down = value
            while (dict[up+1] != nil) {
                up += 1
                length += 1
                dict.removeValue(forKey: up)
            }
            
            while (dict[down-1] != nil) {
                down -= 1
                length += 1
                dict.removeValue(forKey: down)
            }
            
            // 最后移除掉这个值
            dict.removeValue(forKey: value)
            if length > result {
                result = length
            }
        }
        
        return result
    }
}
