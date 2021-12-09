//
//  sim_twovaluesum.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/7/22.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import Foundation

/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class SolutionFortwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        // 使用字典
        var dict: [Int:Int] = [:]
        for (index,value) in nums.enumerated() {
            // 存入字典后，如果存在两个值满足目标，那么在插入后面这个值的时候，前面的值已经写入字典中了
            let other = target - value
            if let result = dict[other] {
                return [result,index]
            }
            dict[value] = index
            
        }
        
        // 双层循环
//        for i in 0..<nums.count {
//            for j in (i+1)..<nums.count {
//                if (nums[i] + nums[j]) == target {
//                    return [i,j];
//                }
//            }
//        }
        
        return [];
    }
    
}
