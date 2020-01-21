//
//  StringTransformZ.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/15.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

class StringTransformZ {
	// "将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。之后，你的输出需要从左往右逐行读取，产生出一个新的字符串"
	func convert(_ s: String, _ numRows: Int) -> String {
		
		if numRows <= 0 || s.count == 0 {
			return ""
		}
		if numRows == 1 {
			return s
		}
		// 中间的 Z 字所占的个数 为 (numRows - 2)
		let middleCount = numRows - 2 > 0 ? numRows - 2 : 0
		
		// 进行排布,共 numRow层，分为 N层即是 N个字符串
		var dic: [Int : String] = [:]
		for index in 1 ... numRows {
			dic[index] = ""
		}
		// 分布每个字符到 各个对应的 层级字符串（竖排和斜排）
		for (index, char) in s.enumerated() {
			// 判断 当前位置在第几层
			
			let reminder = (index + 1) % (numRows + middleCount)
			if reminder == 0 {// 没有余数，即当前在末尾
				dic[2]?.append(char)
			}else if reminder <= numRows {// 余数 在竖排
				dic[reminder]?.append(char)
			}else {
				// 余数在 斜排除了最后一个位置外
				dic[(numRows - (reminder - numRows))]?.append(char)
			}
		}
		
		// 拼接
		var result = ""
		for index in 1 ... numRows {
			result.append(dic[index]!)
		}
		return result
	}
}
