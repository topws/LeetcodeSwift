//
//  DayEight.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/27.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayEight {
    
}
extension DayEight {
    //假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？
    
//    输入: [7,1,5,3,6,4]
//    输出: 5
//    解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//         注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var minV = Int.max
        var maxProfit = 0
        for item in prices {
            // 记录当前的最小值以及当前可得的最大收益
            if item <= minV {
                // 当前值更小，属于向下走，没有收益
                minV = item
            } else {
                // 当前值 大于最小值，属于向上走，有收益
                maxProfit = max(maxProfit, item - minV)
            }
        }
        return maxProfit
    }

}
extension DayEight {
    // 青蛙跳台阶问题
    
//    一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
//
//    答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
    
    // f(n) = f(n-1) + f(n-2)
    // f(0) = 0,f(1) = 1,f(2) = 2
    func numWays(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        if n < 3 {
            return n
        }
        let MOD = 1000000007
        var whileCount = n - 3
        var pre = 1
        var res = 2
        // 从2之后的数开始循环，比如3就是循环一次
        while whileCount >= 0 {
            whileCount -= 1
            let current = (pre + res)%MOD
            pre = res
            res = current
        }
        return res
    }

}

extension DayEight {
    //写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项（即 F(N)）。斐波那契数列的定义如下：
//    F(0) = 0,   F(1) = 1
//    F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
//    斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。
//
//    答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        let MOD = 1000000007
        var whileCount = n - 2
        var res = 1
        var pre = 0
        while whileCount >= 0 {
            whileCount -= 1
            
            var current = (res + pre)
            if current >= MOD {
                current = current % MOD
            }
            pre = res
            res = current
        }
        return res
    }

}
