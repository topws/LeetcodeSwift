//
//  DayTen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/3.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayTen{}
// 最长不含重复字符的子字符串
extension DayTen {
    //请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。
    //输入: "abcabcbb"
    //输出: 3
    //解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        // 记录一个字典，记录当前最长的不重复子串
        var res = 0
        var currentLength = 0
        var dict: [Character:Int] = [:]
        for (index,c) in s.enumerated() {
            if dict[c] == nil {
                // 不存在
                currentLength += 1
                res = max(res, currentLength)
            } else {
                
                let targetIndex = dict[c]!
                // 如果在当前长度之外，不影响
                if currentLength < index - targetIndex {
                    // 且要加上当前这一个
                    currentLength += 1
                    res = max(res, currentLength)
                } else {
                    // 受影响，要更新下current
                    currentLength = index - targetIndex
                }
            }
            dict[c] = index
        }
        return res
    }
}

//把数字翻译成字符串
extension DayTen {
    //给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。
    // 输入: 12258
    // 输出: 5
    // 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
    
    // 动态规划时，考虑用循环别用递归了，使用循环时，可以使用滚动数组（只记录相邻的几个值）的方式节省空间
    func translateNumByWhile(_ num: Int) -> Int {
        
        let str = String(num)
        var arr:[Int] = []
        for c in str {
            arr.append(Int(String(c))!)
        }
        if arr.count < 2 {
            return arr.count
        }
        var p: Int = 1
        var q: Int = 1
        
        // 从第三位开始
        for i in 1...arr.count-1 {
            var current = q
            let flag = arr[i - 1] * 10 + arr[i]
            if flag > 9 && flag < 26 {
                current += p
            }
            p = q
            q = current
        }
        arr = []
        return q
        
    }
    func translateNum(_ num: Int) -> Int {
        // 排序最多两位
        // 找出所有排序，然后判断是否有符合的
        let str = String(num)
        var arr:[Int] = []
        for c in str {
            arr.append(Int.init(String(c))!)
        }
        var dict: [[Int]:Int] = [:]
        return helperTrans(arr, &dict)
    }
    
    func helperTrans(_ arr: [Int], _ dict: inout[[Int]:Int]) -> Int {
        if arr.count <= 1 {return arr.count}
        if arr.count == 2 {
            if arr[arr.count - 2] != 0 && (arr.first! * 10 + arr.last!) < 26 {
                return 2
            } else {
                return 1
            }
        }
        // 最后一位 和 最后两位
        let lastOneArr = Array(arr[0...arr.count-2])
        var lastOne = dict[lastOneArr]
        if lastOne == nil {
            lastOne = helperTrans(lastOneArr,&dict)
            dict[lastOneArr] = lastOne!
        }
        if arr[arr.count - 2] != 0 && (arr[arr.count - 2] * 10 + arr.last!) < 26 {
            let lastTwoArr = Array(arr[0...arr.count-3])
            var lastTwo = dict[lastTwoArr]
            if lastTwo == nil {
                lastTwo = helperTrans(lastTwoArr,&dict)
                dict[lastTwoArr] = lastTwo!
            }
            return lastOne! + lastTwo!
        } else {
            return lastOne!
        }
    }
}
