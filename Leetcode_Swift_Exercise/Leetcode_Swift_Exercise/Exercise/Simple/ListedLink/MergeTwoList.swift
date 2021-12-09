//
//  MergeTwoList.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/29.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class MergeTwoList {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

    
        // 升序，双指针
        var current1 = list1
        var current2 = list2
        var res: ListNode?
        var currentRes: ListNode?
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        if list1!.val < list2!.val {
            res = list1
            current1 = current1?.next
        } else {
            res = list2
            current2 = current2?.next
        }
        currentRes = res
        while current1 != nil || current2 != nil {
            
            if current1 == nil {
                currentRes?.next = current2
                current2 = current2?.next
            } else if current2 == nil {
                currentRes?.next = current1
                current1 = current1?.next
            } else if current1!.val < current2!.val {
                currentRes?.next = current1
                current1 = current1?.next
            } else {
                currentRes?.next = current2
                current2 = current2?.next
            }
            currentRes = currentRes?.next
        }
        return res
    }
}
