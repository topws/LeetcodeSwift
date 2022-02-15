//
//  DayTwo.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/2.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayTwo {
    
    // 使用数组时，应避免插入操作，因为插入的成本比较高
    func reversePrint(_ head: ListNode?) -> [Int] {
        // 反转链表
        var reverseNode: ListNode?
        var current = head
        while current != nil {
            let c = current
            current = current?.next
            c?.next = reverseNode
            reverseNode = c
        }
        var res: [Int] = []
        while reverseNode != nil {
            res.append(reverseNode!.val)
            reverseNode = reverseNode?.next
        }
        return res
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var res: ListNode?
        while current != nil {
            let c = current
            current = current?.next
            c?.next = res
            res = c
        }
        return res
    }
    
    //请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指向链表中的任意节点或者 null。
    func copyRandomList(_ node: RandomNode?) -> RandomNode? {
        // 递归
        var map: [Int: RandomNode] = [:]
        var current = node
        if current == nil {
            return nil
        }
        if map[current!.val] == nil {
            // 当前节点未被创建
            let n = RandomNode.init(current!.val)
            map[current!.val] = n
            
            n.next = copyRandomList(current?.next)
            n.random = copyRandomList(current?.random)
        }
        
        return map[node!.val]
        
        /*
        var current = node
        var new: RandomNode?
        var map: [Int: Int] = [:]
        var mapForValue: [Int: RandomNode] = [:]
        var index = 0
        while current != nil {
            let n = RandomNode.init(current!.val)
            if new == nil {
                new = n
            } else {
                new?.next = n
            }
            mapForValue[current!.val] = n
            if current?.random != nil {
                map[index] = current?.random!.val
            }
            
            current = current?.next
            index += 1
        }
        
        current = new
        index = 0
        while current != nil {
            
            if let value = map[index] {
                current?.random = mapForValue[value]
            }
            current = current?.next
        }
        
        
        return new
         */
    }
}
