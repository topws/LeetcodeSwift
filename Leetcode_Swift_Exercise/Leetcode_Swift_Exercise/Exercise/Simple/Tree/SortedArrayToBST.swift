//
//  SortedArrayToBST.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/6.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class SortedArrayToBST {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {

        // 已排序后的数组
        // 这里默认了 可以组成平衡搜索树
        if nums.count == 0 {
            return nil
        }
        let offset = nums.count / 2
        let root = TreeNode(nums[offset])
//        if offset > 0 {
            root.left = sortedArrayToBST(Array(nums[0...offset-1]))
//        }
//        if offset+1 < nums.count {
            root.right = sortedArrayToBST(Array(nums[offset+1...nums.count-1]))
//        }
                                         
        return root
    }
    
}
