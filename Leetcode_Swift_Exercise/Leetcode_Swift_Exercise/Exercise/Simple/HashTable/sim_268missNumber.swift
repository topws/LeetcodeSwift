//
//  sim_268missNumber.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/31.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个包含 [0, n] 中 n 个数的数组 nums ，找出 [0, n] 这个范围内没有出现在数组中的那个数。
 
 示例 1：

 输入：nums = [3,0,1]
 输出：2
 解释：n = 3，因为有 3 个数字，所以所有的数字都在范围 [0,3] 内。2 是丢失的数字，因为它没有出现在 nums 中。
 
 提示：

 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 nums 中的所有数字都 独一无二

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/missing-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {

        // 数字独一无二，说明有重复的，只有一个数字没出现
        // 1: 数字和 - 减去剩下来的？
        // 2: 每个数字遍历时，排序去正确的位置，找出不连续的值

        let sum = (0 + nums.count)*(nums.count + 1)/2
        return sum - nums.reduce(0, { partialResult, current in
            return partialResult + current
        })
    }
}
