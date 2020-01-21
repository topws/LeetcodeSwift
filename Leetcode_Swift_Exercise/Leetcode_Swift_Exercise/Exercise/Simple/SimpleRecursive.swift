//
//  SimpleRecursive.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/5.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

// 10块钱，买5瓶，4瓶盖兑换 1瓶，2个瓶子换 1瓶，初始有 10元
class SimpleRecursive {
	
	var sum: Int = 0
	var cover: Int = 0//瓶盖
	var body: Int = 0// 瓶子
	func buyBeer(money: Int) -> Int {
		
		cover = money / 2
		body = money / 2
		sum = money / 2
		
		while (cover >= 4 || body >= 2) {
			
			// 应该只 计算当前次的兑换
			// 瓶盖新增
			let coverAdd = cover / 4
			let bodyAdd = body / 2
			sum = sum + coverAdd + bodyAdd
			
			// 计算新的剩余数
			cover = coverAdd + bodyAdd + cover % 4
			body = coverAdd + bodyAdd + body % 2
			
		}
		return sum
	}
	
}
