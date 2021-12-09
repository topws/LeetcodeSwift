//
//  FirstBadVersion.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/6.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class FirstBadVersion {
    func firstBadVersion(_ n: Int) -> Int {
         
        // last is Bad
        return helper(1, n)
    }
    
    func helper(_ left: Int,_ right: Int) -> Int {
        if right == left {
            return right
        }
        // 这里最优的写法是 half = left + (right - left)/2，可以防止Int长度溢出
        // let half = (left + right) / 2
        let half = left + (right - left)/2
        if isBadVersion(half) {
            return helper(left, half)
        }
        return helper(half+1, right)
    }
    
    func isBadVersion(_ version: Int) -> Bool{
        return version >= 4
    }
}
