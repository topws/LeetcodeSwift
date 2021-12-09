//
//  CustomStrConvertInt.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/18.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

// 请你来实现一个 atoi 函数，使其能将字符串转换成整数。
class CustomStrConvertInt {
	func myAtoi(_ str: String) -> Int {
		
		// 查询连续 的整数
		var symbol = ""
		var numStr = ""
		var isValid = false
		for char in str {
			
			let charStr = String(char)
			if !isValid && charStr == " " {
				continue
			}
			if !isValid {
				if "0123456789+-".contains(char) {
					isValid = true
				} else {
					return 0
				}
			}
			// 当前为 symbol
			if charStr == "-" || charStr == "+" {
				
				if symbol.count > 0 {
					break
				} else {
					symbol = charStr
				}
			} else if "0123456789".contains(char) {
				
				// 当前为 数字
				numStr.append(charStr)
				// 如果遇到数字了，前面即使没有 符号也要自动加上 + 号
				if symbol.count == 0 {
					symbol = "+"
				}
			} else {
				
				// 其他的 情况
				if numStr.count > 0 || symbol.count > 0 {
					break
				}
			}
		}
		if numStr.count > 0 {
			// 有值   [−2^31,  2^31 − 1]
			if symbol == "-" {
				
				if let result = Int(numStr) {
					// 如果存在就直接返回该值
					if -result < -INT32_MAX {
						return Int(-INT32_MAX) - 1
					} else {
						return -result
					}
				}
				// 如果不存在，就是长度超过了限制
				return Int(-INT32_MAX) - 1
				
			} else {
				
				if let result = Int(numStr) {
					if result <= INT32_MAX{
						return result
					} else {
						return Int(INT32_MAX)
					}
				}
				return Int(INT32_MAX)
				
			}
			
		}
		return 0
	}
}
