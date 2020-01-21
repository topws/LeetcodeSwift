//
//  IntReverse.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/13.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

// 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

class IntReverse {
	class func reverse(_ x: Int) -> Int {
		
		
		if x < 0 {
			if let newX = getFabs(x) {
				if -newX < -INT32_MAX {
					return 0
				}
				return -newX
			}
		} else {
			if let newX = getFabs(x) {
				if newX < INT32_MAX {
					return newX
				}
				
			}
		}
		
		return 0
	}
	class func getFabs(_ x: Int) -> Int? {
		let x = String.init(format: "%d", Int(fabs(Double(x))))
		return Int(String(x.reversed()))
	}
}
