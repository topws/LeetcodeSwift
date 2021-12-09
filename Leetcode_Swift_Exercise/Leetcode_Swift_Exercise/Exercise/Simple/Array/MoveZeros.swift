//
//  MoveZeros.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/22.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2ba4i/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class MoveZeros {
    func moveZeroes(_ nums: inout [Int]) {

        var zeroCount = 0
        let sum = nums.count
        for i in 0..<nums.count {
            // 倒序删除
            let index = sum - 1 - i
            if nums[index] == 0 {
                zeroCount += 1
                nums.remove(at: index)
            }
        }
        nums.append(contentsOf: Array.init(repeating: 0, count: zeroCount))
    }
}
