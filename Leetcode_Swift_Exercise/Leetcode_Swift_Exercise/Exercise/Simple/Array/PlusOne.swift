//
//  PlusOne.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/19.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2cv1c/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {

//        输入：digits = [1,2,3]
//        输出：[1,2,4]
//        解释：输入数组表示数字 123。
        var res = digits
        for i in 1...res.count {
            let j = res.count - i
            if res[j] + 1 != 10 {
                res[j] = res[j] + 1
                return res
            } else {
                res[j] = 0
            }
        }
        // 如果数组遍历结束了，说明一定是9999\
        res.insert(1, at: 0)
        return res
        
        // 直接反转取值
        var result: [Int] = []
        var isNeedPlusOne = true
        for item in digits.reversed() {
            if isNeedPlusOne {
                
                if item + 1 < 10 {
                    isNeedPlusOne = false
                    result.append(item + 1)
                } else {
                    // 为10
                    result.append(0)
                }
            } else {
                result.append(item)
            }
        }
        if isNeedPlusOne {
            // 处理最后一个数字
            result.append(1)
        }
        return result.reversed()

    }
}
