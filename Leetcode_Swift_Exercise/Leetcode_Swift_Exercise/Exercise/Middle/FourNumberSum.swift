//
//  FourNumberSum.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/20.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

/*
给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。（不重复）
*/
class FourNumberSum {
	
	func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
		
		if nums.count < 4 {
			return []
		}
		
		if nums.count == 4 {
			let total = nums.reduce(0, +)
			if total == target {
				return [nums]
			}else {
				return []
			}
		}
		var setSums = Set<[Int]>()
		var nums = nums
		nums.sort()
		
		var removeIdxArr = nums
		for (idx, value) in nums.enumerated() {
			let newTarget = target - value
			removeIdxArr.remove(at: idx)
			let dst = threeSum(nums: removeIdxArr, newTarget, value)
			
			for eachSet in dst {
				setSums.insert(eachSet)
			}
			
			removeIdxArr = nums
		}
		let setArr = Array(setSums)
		return setArr
		
	}
	
	public func threeSum(nums: [Int], _ target: Int, _ start: Int) -> [[Int]] {
		
		var setSums = Set<[Int]>()
		// 排序数组
		let sourceNums = nums
//		sourceNums.sort()
		if let fir = sourceNums.first {
			if fir > 0 {
				return []
			}
			if fir == 0 && target == 0 && start == 0{
				// 看看是否有三个0
				var zeroArr: Int = 0
				for value in sourceNums {
					if value == 0 {
						zeroArr = zeroArr + 1
					}
				}
				if zeroArr >= 3 {
					return [[0,0,0,0]]
				}
			}
		}
		// 过滤数组用于 找到其他的元素
		var filterNums = sourceNums
		
		for (inx, value) in sourceNums.enumerated() {
			
			// 除去这个value的数组
			// 双指针查找
			filterNums.remove(at: inx)
			var i: Int = 0
			var j: Int = filterNums.count - 1
			
			
			while i < j {
				if filterNums[i] + filterNums[j] + value == target {
					
					// 三个值 排序
					var arr: [Int] = [filterNums[i], filterNums[j], value, start]
					arr.sort()
					setSums.insert(arr)
				}
				// 改变一个指 针
				if  filterNums[i] + filterNums[j] + value < target {
					i = i + 1
				} else {
					j = j - 1
				}
			}
			
			filterNums = sourceNums
		}
		
		let setArr = Array(setSums)
		return setArr
	}
}
