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
    func rob(_ nums: [Int]) -> Int {

        var preLastIsRob = false
        let res = helper(nums, &preLastIsRob)
        
        return res
    }
    
    func helper(_ nums: [Int],_ lastIsRob: inout Bool) -> Int {
        
        if nums.count == 1 {
            lastIsRob = true
            return nums.first!
        }
        if nums.count == 2 {
            if nums.last! > nums.first! {
                lastIsRob = true
                return nums.last!
            } else {
                lastIsRob = false
                return nums.first!
            }
        }
        if nums.count == 3 {
            if nums.first! + nums.last! > nums[1] {
                lastIsRob = true
                return nums.first! + nums.last!
            } else {
                lastIsRob = false
                return nums[1]
            }
        }
        if nums.count == 4 {
            //1,4 -- 1,3, -- 2,4
            let value1 = nums[0] + nums[3]
            let value2 = nums[0] + nums[2]
            let value3 = nums[1] + nums[3]
            
            if value1 >= value2 && value1 >= value3 {
                lastIsRob = true
                return value1
            }
            
            if value2 >= value1 && value2 >= value3 {
                lastIsRob = false
                return value2
            }
            
            if value3 >= value1 && value3 >= value2 {
                lastIsRob = true
                return value3
            }
        }
        
        var preLastIsRob = false
        var preMax = helper(Array(nums[0...nums.count-2]), &preLastIsRob)
        if !preLastIsRob {
            preMax += nums.last!
        }
        return preMax
    }
}
