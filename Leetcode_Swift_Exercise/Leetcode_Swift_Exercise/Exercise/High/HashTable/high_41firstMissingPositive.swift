//
//  high_41firstMissingPositive.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/28.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

 请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
  

 示例 1：

 输入：nums = [1,2,0]
 输出：3
 示例 2：

 输入：nums = [3,4,-1,1]
 输出：2
 示例 3：

 输入：nums = [7,8,9,11,12]
 输出：1
  

 提示：

 1 <= nums.length <= 5 * 105
 -231 <= nums[i] <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-missing-positive
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class FirstMissingPositive {
    func firstMissingPositive(_ nums: [Int]) -> Int {

        // 官方题解：替换
        // 设nums长度N,那么1-N+1内的一个正整数一定是解，因为数组的内容要么不在1-N范围内，要么把1-N填满
        // 把nums内的数据位置调换为符合1...N的数组
        var nums = nums
        let length = nums.count
        for i in 0..<length {
            while (nums[i] <= length && nums[i] >= 1) && (nums[i] != i + 1) && (nums[i] != nums[nums[i] - 1]) {
               
                let temp = nums[nums[i] - 1]
                nums[nums[i] - 1] = nums[i]
                nums[i] = temp
            }
        }
        for i in 0..<length {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return length + 1
        // 目标查未出现最小正整数
        // 负数可以直接跳过
        // 最小正数如果不是1，那么最小数一定是1
        // 如果出现了1，那么最小值就是从1开始连续数出现的首个断层（1，2，3，5，8，4）
        // 假设某个值是最小的正整数A,A>1，且1 - A-1之间的数是连续的,可以建立一个 1 - A范围的数组，只要是连续的
        
        var isFindOne = false
        var max = nums.first!
        var exsit: [Int:Int] = [:]
        for num in nums {
            if num <= 0 {
                continue
            }
            if num == 1 {
                isFindOne = true
            }
            if max < num {
                max = num
            }
            exsit[num] = 1
        }
        
        if isFindOne == false {
            return 1
        }
        // 创建 1 ... max 的数组，然后通过字典移除掉出现的值，剩下的值就是最大，没剩就是max+1
        for i in 1...max {
            if exsit[i] == nil {
                return i
            }
        }
        return max + 1
    }
}
