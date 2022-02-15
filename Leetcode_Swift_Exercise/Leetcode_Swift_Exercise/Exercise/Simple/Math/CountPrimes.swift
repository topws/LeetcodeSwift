//
//  CountPrimes.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/13.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class CountPrimes {
    func countPrimes(_ n: Int) -> Int {

        // 如何判断一个数是否是质数？
        // 埃式筛选
        // 取 不大于 根号N的数中的所有质数，把这些质数的倍数 剔除掉，剩下的就是质数
        
        /*
        先初始化一个数组，全部为质数
        从2开始，将所有质数的x倍标记为合数
        x倍从i开始，因为之前的已经被别的标记过了，例如7 的2倍，3倍等，肯定已经被 i = 2，3时，处理过了
        最后从2开始计算，数组中素数的个数
         */

        if n <= 2 {
            return 0
        }
        if n == 3 {
            return 1
        }
        
        var resArr = Array.init(repeating: true, count: n-1)
        resArr[0] = false
        for i in 2...Int(sqrt(Double(n))) {
            
            if resArr[i-1] {
                var mutiValue = i
                while i * mutiValue < n {
                    resArr[i * mutiValue - 1] = false
                    mutiValue += 1
                }
            }
        }
        var allCount = 0
        for i in 2...n-1 {
            if resArr[i-1] {
                allCount += 1
            }
        }
        
        return allCount
        
    }
}
