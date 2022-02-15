//
//  DayTwentyOne.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/14.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayTwentyOne {}

// 65. 不用加减乘除做加法
extension DayTwentyOne {
    //写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。
    func add(_ a: Int, _ b: Int) -> Int {
        // 每个位置 全是1 ，则自己变为0，且进一位
        // 每个位置 全是0，不变
        // 有一个位置 是1，则自己变为1
        // a+b == （a ^ b）+ (a&b)<<1 (异或取 非进位， 按位与取都是1，然后左移1位)
        if (b == 0) {return a}
        return add(a ^ b, (a & b)<<1)
    }
}

//. 二进制中1的个数
extension DayTwentyOne {
    //编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为 汉明重量).）。
    func hammingWeight(_ n: Int) -> Int {
        /*
        var n = n
        var res = 0
        for _ in 0...31 {
            if (n & 1) == 1 {
                res += 1
            }
            n = n >> 1
        }
        return res
         */
        var n = n
        var res = 0
        while n > 0 {
            res += 1
            n = n & (n - 1)
        }
        return res
    }
}
