//
//  IsPowerOfThree.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/15.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class IsPowerOfThree {
    /*
     给定一个整数，写一个函数来判断它是否是 3 的幂次方。如果是，返回 true ；否则，返回 false 。

     整数 n 是 3 的幂次方需满足：存在整数 x 使得 n == 3x

      3,9,27,81,243,729,2187,6561,19683，59049，177147

     示例 1：

     输入：n = 27
     输出：true
     
     进阶：你能 不使用循环或者递归来完成本题吗？
     */
    func isPowerOfThree(_ n: Int) -> Bool {

        if n == 1 {
            return true
        }
        var initialValue = 1
        while true {
            let current = helper(initialValue)
            if current == n {
                return true
            }
            if current < n {
                initialValue = current
            } else {
                return false
            }
        }
    }
    
    func helper(_ n: Int) -> Int {
        return 3 * n
    }
}
