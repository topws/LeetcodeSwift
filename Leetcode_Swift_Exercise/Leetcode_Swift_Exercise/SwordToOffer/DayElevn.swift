//
//  DayElevn.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/3.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayElevn {}
// 链表中倒数第k个节点
extension DayElevn {
//    输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。
//
//    例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        // 双指针，间隔k(k >= 1)
        var pre: ListNode? = head
        var current: ListNode? = head
        var startIndex = k
        while current != nil {
            current = current?.next
            if startIndex == 0 {
                // 共同下移
                pre = pre?.next
            } else {
                startIndex -= 1
            }
        }
       return pre
    }
}

//删除链表的节点
extension DayElevn {
//    给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。
//    返回删除后的链表的头节点。
//    注意：此题对比原题有改动
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {return nil}
        if head!.val == val {
            return head?.next
        }
        var next = head?.next
        var pre = head
        while next != nil {
            if next!.val == val {
                pre?.next = next?.next
                break
            } else {
                pre = next
            }
            next = next?.next
        }
        return head
    }
}
