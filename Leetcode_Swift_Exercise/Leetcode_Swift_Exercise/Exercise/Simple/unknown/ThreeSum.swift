//
//  ThreeSum.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/10.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
*/
class ThreeSum {
	
	public func threeSum(nums: [Int]) -> [[Int]] {
	
		var setSums = Set<[Int]>()
		// 排序数组
		var sourceNums = nums
		sourceNums.sort()
		if let fir = sourceNums.first {
			if fir > 0 {
				return []
			}
			if fir == 0 {
				// 看看是否有三个0
				var zeroArr: Int = 0
				for value in sourceNums {
					if value == 0 {
						zeroArr = zeroArr + 1
					}
				}
				if zeroArr >= 3 {
					return [[0,0,0]]
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
				if filterNums[i] + filterNums[j] + value == 0 {

					// 三个值 排序
					var arr: [Int] = [filterNums[i], filterNums[j], value]
					arr.sort()
					setSums.insert(arr)
				}
				// 改变一个指 针
				if  filterNums[i] + filterNums[j] + value < 0 {
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
