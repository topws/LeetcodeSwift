//
//  LongestCommonPrefix.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/9.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

class LongestCommonPrefix {
	// ["flower","flow","flight"]
	/*
	编写一个函数来查找字符串数组中的最长公共前缀。
	
	如果不存在公共前缀，返回空字符串 ""。
	*/
	func longestCommonPrefix(_ strs: [String]) -> String {
		var pre = ""
		
		// 先找出 最短的 一个字符串
		var smallestStr = strs.first ?? ""
		for value in strs {
			if smallestStr.count > value.count {
				smallestStr = value
			}
		}
		// 循环 最短的 字符串
		
		for (inx, value) in smallestStr.enumerated() {
			
			for (index,allStrCha) in strs.enumerated() {
				
				if let char = allStrCha.prefix(inx + 1).last {
				
					if char == value {
						if index == strs.count - 1 {
							pre.append(char)
						}
						continue
					} else {
						return pre
					}
				}
			}
		}
		return pre
	}
}
extension String {
	public func substring(from index: Int) -> String {
		if self.characters.count > index {
			let startIndex = self.index(self.startIndex, offsetBy: index)
			let subString = self[startIndex..<self.endIndex]
			
			return String(subString)
		} else {
			return self
		}
	}
}
