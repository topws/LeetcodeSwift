//
//  IntersectArray.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/19.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定两个数组，编写一个函数来计算它们的交集。
 
 
 如果给定的数组已经排好序呢？你将如何优化你的算法？
  -- > 双指针
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
  -- > 直接拿 nums1的所有元素 去nums2 中找？
    -- > 用小的数组存储字典时，可以有效的降低空间复杂度
 如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
 -- > 字典存储结果？（类似于上面的第二个问题）

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2y0c2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class IntersectArray {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        // key value
        var dict: [Int:Int] = [:]
        for item in nums1 {
            dict[item] = dict[item, default:0] + 1
        }
        var result:[Int] = []
        for item in nums2 {
            if let v = dict[item] {
                result.append(item)
                if v == 1 {
                    dict.removeValue(forKey: item)
                } else {
                    dict[item] = v - 1
                }
            }
        }
        return result
    }
}
