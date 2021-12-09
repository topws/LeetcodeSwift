//
//  TelephoneCombination.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/17.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
* 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
*/
class CharacterCombinations {
	func letterCombinations(_ digits: String) -> [String] {
		
		var digits = digits
		var dst: [String] = []
		let numberMap = ["2" : ["a","b","c"],
						 "3" : ["d","e","f"],
						 "4" : ["g","h","i"],
						 "5" : ["j","k","l"],
						 "6" : ["m","n","o"],
						 "7" : ["p","q","r","s"],
						 "8" : ["t","u","v"],
						 "9" : ["w","x","y","z"]
		]
		if digits.count == 0 {
			return []
		}
		if digits.count == 1 {
			return numberMap[digits]!
		}
		if digits.count > 1 {
			dst = numberMap[String(digits.first!)]!
		}
		digits.removeFirst()
		
		// 给定字符串，已知所有排序的个数，
		// 遍历排序
		for char in digits {
			
			guard let numberMapArr = numberMap[String(char)] else {
				return []
			}
			
			dst = oneNumberCombinations(dst, numberMapArr)
		}
		return dst
	}
	
	// 添加一个数字
	func oneNumberCombinations(_ dst: [String], _ mapArr: [String]) -> [String] {
		
		var newdst: [String] = []
		// 双层遍历
		for str in mapArr {
			newdst.append(contentsOf: dst.map({ (value) -> String in
				return value + str
			}))
		}
		
		return newdst
	}
}
