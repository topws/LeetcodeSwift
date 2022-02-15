//
//  DayFour.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/4.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayFour {
    //找出数组中重复的数字。（数字在0 - n-1）
    //    输入：
    //    [2, 3, 1, 0, 2, 5, 3]
    //    输出：2 或 3
    // 如果要求不能用字典，要考虑使用排序或者使用 原来的nums数组存储数据或者 使用二分查找（）
    func findRepeatNumber(_ nums: [Int]) -> Int {

        var dic: [Int: Bool] = [:]
        for num in nums {
            if dic[num] == true {
                return num
            }
            dic[num] = true
        }
        return -1
    }
    
    
    //统计一个数字在排序数组中出现的次数。
    //输入: nums = [5,7,7,8,8,10], target = 8
    //输出: 2
    func search(_ nums: [Int], _ target: Int) -> Int {

        // 二分找到相等的数字
        let index = help(nums, target,0,nums.count-1)
        if index == -1 {
            return 0
        }
        // 左右两个方向
        var count = 1
        var left = index
        while (left - 1 >= 0 && nums[left - 1] == target) {
            count += 1
            left -= 1
        }
        left = index
        while (left + 1 < nums.count && nums[left + 1] == target) {
            count += 1
            left += 1
        }
        return count
        
    }
    func help(_ nums: [Int], _ target: Int,_ left: Int,_ right: Int) -> Int {
        let leftV = nums[left]
        let rightV = nums[right]
        if leftV == target {
            return left
        }
        if rightV == target {
            return right
        }
        if right - left == 1 {
            return -1
        }
        if target < leftV || target > rightV {
            return -1
        }
        
        let half = (left + right)/2
        if nums[half] == target {
            return half
        }
        if nums[half] < target {
            return help(nums, target, half, right)
        }
        return help(nums, target, left, half)
    }
}
