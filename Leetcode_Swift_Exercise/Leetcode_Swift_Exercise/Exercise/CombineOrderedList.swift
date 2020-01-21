//
//  CombineOrderedList.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/6/22.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
//将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
//输入：1->2->4, 1->3->4
//输出：1->1->2->3->4->4


class CombineOrderedList {
    
        
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        
        // 先分开取 数组
        var l1Next = l1
        var l1Value: [Int] = []
        while l1Next != nil {
            l1Value.append(l1Next!.val)
            l1Next = l1Next?.next
        }
        var l2Next = l2
        var l2Value: [Int] = []
        while l2Next != nil {
            l2Value.append(l2Next!.val)
            l2Next = l2Next?.next
        }
        
        // 反转后
        l1Value = l1Value.reversed()
        l2Value = l2Value.reversed()
        
        // 双指针排序
        var i = 0
        var j = 0
        var sumValue: [Int] = []
        while i < l1Value.count || j < l2Value.count {
            
            if i < l1Value.count && j < l2Value.count{// 都有值
                
                if l1Value[i] > l2Value[j] {
                    sumValue.append(l1Value[i])
                    i += 1
                } else {
                    sumValue.append(l2Value[j])
                    j += 1
                }
            } else if i < l1Value.count {// i 有值
                sumValue.append(l1Value[i])
                i += 1
            } else {//j 有值
                sumValue.append(l2Value[j])
                j += 1
            }
            
        }
        
        // 最后再遍历生成目标链表
        var sumNode: ListNode?
        for value in sumValue {
            let list = ListNode(value)
            list.next = sumNode
            sumNode = list
        }
        
        return sumNode
    }
    
}

extension CombineOrderedList {
    
    
    func mergeTwoListsOther(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if l1!.val < l2!.val {
            let listNode = ListNode.init(l1!.val)
            listNode.next = mergeTwoLists(l1?.next, l2)
            return listNode
        } else {
            let listNode = ListNode.init(l2!.val)
            listNode.next = mergeTwoLists(l2?.next, l1)
            return listNode
        }
    }
}
