//
//  ThreeSumClosest.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/14.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

/*
给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
*/

class ThreeSumClosest {
	
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		if nums.count < 3 {return 0}
		var dst: Int = nums[0] + nums[1] + nums[2]
		if nums.count == 3 {return dst}
		// 先排序
		var nums = nums
		nums.sort()
		
		// 固定一个值，然后通过双指针的方式来确定最优值
		for (idx, value) in nums.enumerated() {
			
			
			var filters = nums
			filters.remove(at: idx)
			var i = 0
			var j = filters.count - 1
			
			while i < j {
				let closest = value + filters[i] + filters[j]
				
				if abs(closest - target) < abs(dst - target) {
					dst = closest
				}
				// 根据当前值调整位置
				if closest == target {
					return closest
				} else if closest < target {
					// 变大
					i = i + 1
				} else {
					j = j - 1
				}
			}
		}
		return dst
	}
	
}
