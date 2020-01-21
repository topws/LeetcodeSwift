//
//  SimpleExercise0.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/4.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

/*
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

示例:

给定 nums = [2, 8, 11, 7], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
*/

class SimpleExercise0 {
	/*
	class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		if nums.count < 2 {
			return []
		}
		
		for index in 0 ..< nums.count {
			
			for j in index + 1 ..< nums.count {
				if nums[index] + nums[j] == target {
					return [index, j]
				}
			}
		}

		return []
	}
	*/
	class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		
		if nums.count < 2 {
			return []
		}
		
		var maps: [Int:Int] = [:]
		for index in 0 ..< nums.count {
			maps[nums[index]] = index
		}
		for index in 0 ..< nums.count {
			let complement = target - nums[index]
			if let success = maps[complement],success != index {
				return [index,success]
			}
		}
		
		return []
	}
}
