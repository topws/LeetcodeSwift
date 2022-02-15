//
//  DayTwentyTwo.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/15.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayTwentyTwo {}

extension DayTwentyTwo {
    // I. 数组中数字出现的次数
    // 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var dict: [Int: Bool] = [:]
        for item in nums {
            if dict[item] == nil {
                dict[item] = true
            } else {
                dict.removeValue(forKey: item)
            }
        }
        return Array(dict.keys)
    }
}
