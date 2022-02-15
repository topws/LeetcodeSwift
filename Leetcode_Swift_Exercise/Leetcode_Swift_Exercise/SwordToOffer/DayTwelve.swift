//
//  DayTwelve.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/4.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayTwelve {}
// 相交链表
extension DayTwelve {
//    给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            if headA == nil || headB == nil {
                return nil
            }
            // 双指针，分别从A，B头结点开始移动，且移动A+B次，那么通过这样就能让移动的长度相同，如果存在相交则一定会找到
            var tempA = headA
            var tempB = headB

            while (true) {
                var aPointer: Int64 = 0
                withUnsafePointer(to: &tempA) { ptr in
                    aPointer = unsafeBitCast(ptr.pointee, to: Int64.self)
                }
                var bPointer: Int64 = 0
                withUnsafePointer(to: &tempB) { ptr in
                    bPointer = unsafeBitCast(ptr.pointee, to: Int64.self)
                }
                if aPointer == bPointer {
                    // 相同
                    return tempA
                }
                

                // 走了两遍仍为nil 代表不存在
                if tempA == nil {
                    tempA = headB
                } else {
                    tempA = tempA!.next
                }
                if tempB == nil {
                    tempB = headA
                } else {
                    tempB = tempB!.next
                }
            }
            return tempA
        }
}
//合并两个排序的链表
extension DayTwelve {
    //输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。
    //输入：1->2->4, 1->3->4
    //输出：1->1->2->3->4->4
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {return l2}
        if l2 == nil {return l1}
        var a = l1
        var b = l2
        var res: ListNode!
        if l1!.val > l2!.val {
            res = ListNode(b!.val)
            b = b?.next
        } else {
            res = ListNode(a!.val)
            a = a?.next
        }
        var resNext = res
        while a != nil || b != nil {
            var item: Int = 0
            if a == nil {
                item = b!.val
                b = b?.next
            } else if b == nil {
                item = a!.val
                a = a?.next
            } else {
                if a!.val > b!.val {
                    item = b!.val
                    b = b?.next
                } else {
                    item = a!.val
                    a = a?.next
                }
            }
            let new = ListNode(item)
            resNext?.next = new
            resNext = resNext?.next
        }
        return res
    }
}
