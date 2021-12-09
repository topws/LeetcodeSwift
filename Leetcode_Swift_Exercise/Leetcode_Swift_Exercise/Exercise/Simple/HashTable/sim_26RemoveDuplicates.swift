//
//  sim_26DeleteRepeatValueInSortedArray.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/27.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import Foundation
/*
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

  

 说明:

 为什么返回数值是整数，但输出的答案是数组呢?

 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

 你可以想象内部操作如下:

 // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
 int len = removeDuplicates(nums);

 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }
  
 示例 1：

 输入：nums = [1,1,2]
 输出：2, nums = [1,2]
 解释：函数应该返回新的长度 2 ，并且原数组 nums 的前两个元素被修改为 1, 2 。不需要考虑数组中超出新长度后面的元素。
 示例 2：

 输入：nums = [0,0,1,1,1,2,2,3,3,4]
 输出：5, nums = [0,1,2,3,4]
 解释：函数应该返回新的长度 5 ， 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4 。不需要考虑数组中超出新长度后面的元素。
  

 提示：

 0 <= nums.length <= 3 * 104
 -104 <= nums[i] <= 104
 nums 已按升序排列

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // 有序数组，那么可以直接使用字典，因为key必不会重复,问题是如何移除元素？倒序移除
        // 优化：由于是有序的，那么就不需要存所有的Key，只需要最新的一个就可以了
        var previous: Int?
        let numsL = nums.count
        for (index,value) in nums.reversed().enumerated() {
            if let pre = previous {
                if pre == value {
                    // remove
                    nums.remove(at: numsL - 1 - index)
                    continue
                }
            }
            previous = value
        }
        return nums.count
    }
    
    func trick(_ nums: inout [Int]) -> Int {
        // 不能开辟新的数组记录。那如果直接创建新的数组并且赋值给旧数组，是不是也可以通过？
        
        var newNums:[Int] = []
        for item in nums {
            if let value = newNums.last {
                // 存在判断是否相等
                if value == item {
                    continue
                }
            }
            // 不存在OR不相等直接赋值
            newNums.append(item)
        }
        nums = newNums
        return newNums.count
    }
}
