//
//  MaxSubArray.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/8.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

/*
 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 子数组 是数组中的一个连续部分。
 
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 */
class MaxSubArray {
    func maxSubArray(_ nums: [Int]) -> Int {

        var preMax = 0
        var maxR = nums.first!
        for item in nums {
            preMax = max(preMax+item,item)
            maxR = max(maxR,preMax)
        }
        return maxR
    }
    
}
