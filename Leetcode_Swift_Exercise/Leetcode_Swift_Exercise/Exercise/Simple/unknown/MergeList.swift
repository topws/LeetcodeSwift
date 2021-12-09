//
//  MergeList.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/6.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class MergeList {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        if nums1.count <= n {
            nums1.removeAll()
            nums1 = nums2
            return
        }
        if n == 0 {
            return
        }
        
        let oldC = nums1.count
        for index in 0..<oldC {
            let reverseIndex = oldC - 1 - index
            if reverseIndex > oldC - 1 - n {
                nums1.remove(at: reverseIndex)
                continue
            }
        }
        
        let newC = nums1.count
        var offset = n - 1
        for index in 0..<newC {
            let reverseIndex = newC - 1 - index
            
            while (nums2[offset] >= nums1[reverseIndex]) {
                // 插入
                nums1.insert(nums2[offset], at: reverseIndex+1)
                offset -= 1
                if offset < 0 {
                    return
                }
            }
        }
        // 没有return 说明没插完，offset之前的全部插入0位置
        
        nums1.insert(contentsOf: nums2[0...offset], at: 0)
        print("nums1 = \(nums1)")
    }
}
