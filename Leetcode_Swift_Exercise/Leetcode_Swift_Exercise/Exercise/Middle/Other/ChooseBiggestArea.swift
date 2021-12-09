//
//  ChooseBiggestArea.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/7.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器，且 n 的值至少为 2。
*/
class ChooseBiggestArea {
	
	// [1,8,6,2,5,4,8,3,7]
	
	func getMaxArea(arr: [Int]) -> Int {
		
		var maxArea = 0
		// 双指针(前进的间隔固定为1，即变化时宽度必定少1，所以改变更矮的那边必然等到的面积更大)
		var firstPoint: Int = 0
		var lastPoint: Int = arr.count - 1
		
		while firstPoint < lastPoint {
			maxArea = max(min(arr[firstPoint], arr[lastPoint]) * (lastPoint - firstPoint), maxArea)
			
			if arr[firstPoint] < arr[lastPoint] {
				firstPoint = firstPoint + 1
			} else {
				lastPoint = lastPoint - 1
			}
		}
		
		return maxArea
	}
}
