//
//  ClimbStairs.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/7.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。
 */
class ClimbStairs {
    var valueCache: [Int:Int] = [:]
    func climbStairs(_ n: Int) -> Int {

        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        var left = valueCache[n-1]
        if left == nil {
            left = climbStairs(n-1)
            valueCache[n-1] = left
        }
        var right = valueCache[n-2]
        if right == nil {
            right = climbStairs(n-2)
            valueCache[n-2] = right
        }

        return left! + right!
    }
}

