//
//  DayThirteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/4.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayThirteen {}

// 剑指 Offer 58 - I. 翻转单词顺序
extension DayThirteen {
//    输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。
    func reverseWordsByTwoPointer(_ s: String) -> String {
        // 一个前进，一个追加
        var res: String = ""
        var current: String = ""
        var arr: [String] = []
        for c in s {
            if c == " " {
                if current.count == 0 {
                    continue
                } else {
                    // 单个单词结束
                    arr.append(current)
                    current = ""
                }
            } else {
                current = current + String(c)
            }
        }
        if current.count > 0 {
            arr.append(current)
        }
        for item in arr.reversed() {
            res = res + " " + item
        }
        if res.count > 0 {
            res.removeFirst()
        }
        return res
    }
    func reverseWords(_ s: String) -> String {
        if s == "" {return ""}
        let arr = s.components(separatedBy: " ")
        var res = arr.reversed().reduce("") { partialResult, str in
            if str != "" {
                return partialResult + str + " "
            } else {
                return partialResult
            }
            
        }
        if res.count > 0 {
            res.removeLast()
        }
        return res
    }
}

// 和为s的两个数字
extension DayThirteen {
    //输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。
    //如果有多对数字的和等于s，则输出任意一对即可。
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var left: Int = 0
        var right: Int = nums.count - 1
        while left < right {
            let sum = nums[right] + nums[left]
            if sum == target {
                return [nums[right],nums[left]]
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }
        if nums[right] + nums[left] == target {
            return [nums[right], nums[left]]
        }
        return []
    }
}


//调整数组顺序使奇数位于偶数前面
extension DayThirteen {
 //输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数在数组的前半部分，所有偶数在数组的后半部分。
    func exchange(_ nums: [Int]) -> [Int] {

        var mutableNums = nums
        var index = 0
        var exchangedCount = 0
        let n = nums.count
        while index < n - exchangedCount {
            
            // 偶数，丢到最后
            while mutableNums[index] % 2 == 0 {
                let temp = mutableNums[n - 1 - exchangedCount]
                mutableNums[n - 1 - exchangedCount] = mutableNums[index]
                mutableNums[index] = temp
                exchangedCount += 1
                
                if index + exchangedCount == n {
                    // 直接结束
                    return mutableNums
                }
            }
            // 前进一步
            index += 1
        }
        return mutableNums
        /* */
        var pre: [Int] = []
        var sub: [Int] = []
        for item in nums {
            if item % 2 == 0 {
                sub.append(item)
            } else {
                pre.append(item)
            }
        }
        return Array(pre + sub)
    }
}
