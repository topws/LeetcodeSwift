//
//  DaySixteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/7.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DaySixteen {}

// 45. 把数组排成最小的数
extension DaySixteen {
    //输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
    func minNumber(_ nums: [Int]) -> String {
        
        // 快拍
        var new = nums
        minHelper(&new, 0, nums.count-1)
        var res: String = ""
        for item in new {
            res.append(String(item))
        }
        return res
    }
    
    func minHelper(_ nums: inout [Int],_ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        var pivot = left
        var index = pivot + 1// 待交换的位置
        let pivotValue = nums[left]
        for (j,item) in nums[left + 1 ... right].enumerated() {
            if isBigger(pivotValue, item) {//左边大于右边
                //交换
                nums.swapAt(index, j + left + 1)
                index += 1
            }
        }
        // 交换哨兵
        pivot = index - 1
        nums.swapAt(pivot, left)
        minHelper(&nums, left, pivot - 1)
        minHelper(&nums, pivot + 1 , right)
    }
    
    func isBigger(_ left: Int,_ right: Int) -> Bool {
        var leftArr: [Int] = [left % 10]
        var newLeft = left
        while newLeft > 10 {
            newLeft = newLeft / 10
            leftArr.append(newLeft % 10)
        }
        
        var rightArr: [Int] = [right % 10]
        var newRight = right
        while newRight > 10 {
            newRight = newRight / 10
            rightArr.append(newRight % 10)
        }
        // 比较每一位的大小，不存在的位 取第0位
        leftArr = leftArr.reversed()
        rightArr = rightArr.reversed()
        let n = leftArr.count + rightArr.count
        for index in 0...n-1 {
            var currentLeft = 0;
            if index < leftArr.count {
                currentLeft = leftArr[index]
            } else {
                currentLeft = rightArr[index - leftArr.count]
            }
            var currentRight = 0
            if index < rightArr.count {
                currentRight = rightArr[index]
            } else {
                currentRight = leftArr[index - rightArr.count]
            }
            if currentLeft == currentRight {
                continue
            }
            return currentLeft > currentRight
        }
        return true
    }
}



// 61. 扑克牌中的顺子
extension DaySixteen {
//    从若干副扑克牌中随机抽 5 张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

    func isStraight(_ nums: [Int]) -> Bool {
        // 五张 能为顺子，大小王任意配，
        // 先把大小王筛选出，排序后统计差值，看看大小王能否补上（差值为4）
        // 重复牌 得要筛选出去
        
        var new: [Int] = nums
        new.sort()
        var pre: Int? = nil
        var sum = 0
        for item in nums {
            if item == 0 {
                continue
            }
            if pre == nil {
                pre = item
            } else {
                sum += item - pre!
                pre = item
            }
        }
        return sum <= 4
    }
}
