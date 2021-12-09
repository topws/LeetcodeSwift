//
//  RotateArray.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/18.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class RotateArray {
    /*
     输入：nums = [-1,-100,3,99], k = 2
     输出：[3,99,-1,-100]
     解释:
     向右轮转 1 步: [99,-1,-100,3]
     向右轮转 2 步: [3,99,-1,-100]

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2skh7/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        // 倒序往前插入
        
        let offset = k % nums.count
        if offset == 0 || nums.count == 0 {
            return
        }
        for _ in 0..<k {
            let item = nums.last!
            nums.insert(item, at: 0)
            nums.removeLast()
        }
    }
    
    func cutArray(_ nums: inout [Int], _ k: Int) {
        // 直接数组截取
        let offset = k % nums.count
        if offset == 0 {
            return
        }
        let range: Range = Range.init(NSMakeRange(0, nums.count - offset - 1))!
        let sub = nums[0..<nums.count - offset]
        nums.removeSubrange(range)
        nums.append(contentsOf: sub)
    }
}
