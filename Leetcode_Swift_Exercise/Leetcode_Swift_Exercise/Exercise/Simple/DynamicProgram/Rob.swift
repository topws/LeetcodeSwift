//
//  Rob.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/8.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

/*
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

 给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

 示例 1：

 输入：[1,2,3,1]
 输出：4
 解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最高金额 = 1 + 3 = 4 。
 */

class Rob {
    
    var dict: [Int:Int] = [:]
    func rob(_ nums: [Int]) -> Int {

        if let res = dict[nums.count] {
            return res
        }
        
        let res = help(nums)
        dict[nums.count] = res
        
        return res
    }
    
    func help(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        if nums.count == 2 {
            return max(nums.first!, nums.last!)
        }
        
        let last = rob(Array(nums[0..<nums.count - 2])) + nums.last!
        let noLast = rob(Array(nums[0..<nums.count-1]))
        return max(last, noLast)
    }
    
    
}
