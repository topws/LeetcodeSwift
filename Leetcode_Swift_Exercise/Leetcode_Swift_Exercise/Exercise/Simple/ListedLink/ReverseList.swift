//
//  ReverseList.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/29.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class ReverseList {
    func reverseList(_ head: ListNode?) -> ListNode? {

        var reversedList:ListNode? = head
        while head?.next != nil {
            
            let cur = head?.next
            head?.next = head?.next?.next
            cur?.next = reversedList
            reversedList = cur
        }
        return reversedList
    }
}
