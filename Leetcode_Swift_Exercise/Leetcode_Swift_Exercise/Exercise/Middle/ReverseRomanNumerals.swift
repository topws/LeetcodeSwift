//
//  ReverseRomanNumerals.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/7.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。

字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
给定一个整数，将其转为罗马数字。输入确保在 1 到 3999 的范围内。
*/
class ReverseRomanNumerals {
	
	func intToRoman(count: Int) -> String {
		var romanStr: String = ""
		
		var currentValue = count
		// 千位
		if currentValue >= 1000 {
			for _ in 0 ... (currentValue / 1000 - 1 ) {
				romanStr.append("M")
			}
		}
		
		currentValue = currentValue % 1000
		// 500 - 1000
		if currentValue >= 500 {
			// 特殊情况 900
			if currentValue >= 900 {
				romanStr = romanStr + "CM"
				currentValue = currentValue - 900
			}else {
				
				romanStr.append("D")
				currentValue = currentValue - 500
			}
			
		}
		// 100 - 500
		if currentValue >= 100 {
			// 特殊情况 400
			for _ in 0 ... (currentValue / 100 - 1) {
				romanStr.append("C")
			}
		}
		
		currentValue = currentValue % 100
		// 50 - 100
		if currentValue >= 50 {
			romanStr.append("L")
			currentValue = currentValue - 50
		}
		// 10 - 50
		if currentValue >= 10 {
			for _ in 0 ... (currentValue / 10 - 1) {
				romanStr.append("X")
			}
		}
		
		currentValue = currentValue % 10
		// 5 - 10
		if currentValue >= 5 {
			romanStr.append("V")
			currentValue = currentValue - 5
		}
		// 0 - 5
		if currentValue >= 1 {
			for _ in 0 ... (currentValue / 1 - 1) {
				romanStr.append("I")
			}
		}
		
		return romanStr
	}
}
