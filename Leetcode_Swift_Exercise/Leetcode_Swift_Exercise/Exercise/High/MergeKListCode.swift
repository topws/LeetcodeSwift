//
//  MergeKListCode.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/7/5.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 输入:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 */

class MergeKListCode {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
  
        return functionOne(lists)
        
    }
    
    func functionOne(_ lists: [ListNode?]) -> ListNode? {
        var listNodeValues: [[Int]] = []
        
        for node in lists {
            
            var l1Next = node
            var l1Value: [Int] = []
            while l1Next != nil {
                l1Value.append(l1Next!.val)
                l1Next = l1Next?.next
            }
            l1Value = l1Value.reversed()
            listNodeValues.append(l1Value)
        }
        
        // 开始合并
        if listNodeValues.count < 1{
            return nil
        }
        if listNodeValues.count == 1 {
            return createListNode(sumValue: listNodeValues.first!)
        }
        var preValues = listNodeValues.first!
        listNodeValues.removeFirst()
        for value in listNodeValues {
            preValues = mergeTwoLists(preValues, value)
        }
        return createListNode(sumValue: preValues)
    }
    func createListNode(sumValue: [Int]) -> ListNode? {
        // 最后再遍历生成目标链表
        var sumNode: ListNode?
        for value in sumValue {
            let list = ListNode(value)
            list.next = sumNode
            sumNode = list
        }
        
        return sumNode
    }
    func mergeTwoLists(_ l1Value: [Int], _ l2Value: [Int]) -> [Int] {
        
        
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
        
        return sumValue
    }
}


