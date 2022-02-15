//
//  TwoBigNumberAdd.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/15.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
// 与大数相加逻辑类似
class TwoBigNumberAdd{
    //给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和并同样以字符串形式返回。
    
    //你不能使用任何內建的用于处理大整数的库（比如 BigInteger）， 也不能直接将输入的字符串转换为整数形式。

    func addStrings(_ num1: String, _ num2: String) -> String {
        
        // 每一位单独相加，并且记录一个进位
        var resArr:[Int] = []
        var leftArr: [Int] = []
        var rightArr: [Int] = []
        for c in num1 {
            leftArr.append(Int(String(c))!)
        }
        for c in num2 {
            rightArr.append(Int(String(c))!)
        }
        // 从最后一位开始相加
        let maxL = max(leftArr.count, rightArr.count)
        var count = 0
        for index in 0...maxL-1 {
            // 左数组的index
            var leftValue = 0
            if index < leftArr.count {
                let leftIndex = leftArr.count - 1 - index
                leftValue = leftArr[leftIndex]
            }
            var rightValue = 0
            if index < rightArr.count {
                let rightIndex = rightArr.count - 1 - index
                rightValue = rightArr[rightIndex]
            }
            let currentSum = leftValue + rightValue + count
            count = currentSum / 10
            resArr.append(currentSum % 10)
        }
        if (count > 0) {
            resArr.append(count)
        }
        // 倒序数组拼接字符串
        var resStr: String = ""
        for item in resArr.reversed() {
            resStr.append(String(item))
        }
        return resStr
    }
}
