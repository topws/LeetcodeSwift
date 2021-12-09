//
//  sim_169.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/28.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

  

 示例 1：

 输入：[3,2,3]
 输出：3
 示例 2：

 输入：[2,2,1,1,1,2,2]
 输出：2
  

 进阶：

 尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/majority-element
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {

        // Boyer-Moore 投票算法
        // 最大的特征是 大于一半的数量，那么也就是说别的所有的类型全部加起来也是小于这个值的数量的，那么可以设计成不同数消减，这样消减到最后剩下的一定是最大数的那个，但是如果本身不存在最大数的话，那么消减出来的数则是随机的

        var target: Int = 0
        var remainder: Int = 0
        for num in nums {
            if remainder == 0 {
                target = num
                remainder += 1
            } else {
                // 投票者存在
                if num == target {
                    remainder += 1
                } else {
                    remainder -= 1
                }
            }
        }
        return target
        
        // 空间比较大
//        // 大于 n/2,说明一定是只存在一个多数元素
//        var map:[Int:Int] = [:]
//        for num in nums {
//            if let value = map[num] {
//                map[num] = value + 1
//                if value + 1 > nums.count / 2 {
//                    return num
//                }
//            } else {
//                map[num] = 1
//            }
//        }
//        return nums.first!
    }
    
}
