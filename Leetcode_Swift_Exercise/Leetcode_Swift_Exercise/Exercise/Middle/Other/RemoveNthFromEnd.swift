//
//  RemoveNthFromEnd.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/5/21.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

示例：

给定一个链表: 1->2->3->4->5, 和 n = 2.

当删除了倒数第二个节点后，链表变为 1->2->3->5.
*/
class RemoveNthFromEnd {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        if head == nil {
            return head
        }
        
        // find all count
        var count = 0
        var current = head
        while current != nil {
            count += 1
            current = current?.next
        }
        // remove all - n
        if count - n == 0 {
            return head?.next
        }
        current = head
        var offset = 0
        while offset != count - n - 1 {
            offset += 1
            current = current?.next
        }
        current?.next = current?.next?.next
        return head
    }
    
    
    
    
    
    
    
    
    
    
    
    
    private func function4(_ head: ListNode?, _ n: Int) -> ListNode?{

        let dummy: ListNode? = ListNode.init(0)
        dummy?.next = head
        
        var first = dummy
        var second = dummy
        
        for _ in 1...(n + 1) {
            first = first?.next
        }
        while first != nil {
            first = first?.next
            second = second?.next
        }
        second?.next = second?.next?.next
        return dummy?.next
       
    }
    private func function3(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        // 快慢指针，快 N 个结点,当快指针next为nil时，慢指针为目标值
        var index: Int = 0
        
        var fastNode: ListNode? = ListNode.init(0)
        var slowNode: ListNode? = ListNode.init(0)
        fastNode?.next = head
        slowNode?.next = head
        let result: ListNode? = slowNode
        if n == 0 {return head}
        //0， 1,2    2
        while fastNode != nil {
            
            if index == n + 1 {
                
                if fastNode?.next == nil {
                    // 处理 N 为边界值
                    break
                } else {
                    
                    fastNode = fastNode?.next
                    slowNode = slowNode?.next
                }
                
            } else {
                index += 1
                fastNode = fastNode?.next
            }
            
        }
        slowNode?.next = slowNode?.next?.next
        return result?.next
    }

    
    private func function2(_ head: ListNode?, _ n: Int)  -> ListNode? {
        
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        // 计算 总count
        var nodeCount = 0
        var node = head
        while node != nil {
            nodeCount += 1
            node = node?.next
        }
        
        nodeCount -= n
        var first = dummy
        while nodeCount > 0 {
            nodeCount -= 1
            first = first?.next
        }
        
        first?.next = first?.next?.next
        return dummy?.next
        
        
    }
    private func function1(_ head: ListNode?, _ n: Int)  -> ListNode? {
        var nodes: [Int] = []
        
        var node = head
        while node != nil {
            nodes.append(node!.val)
            node = node?.next
        }
        // remove n
        nodes.remove(at: (nodes.count - n))
        nodes = nodes.reversed()
        if nodes.count == 0 {return nil}
        
        
        var result = ListNode(nodes.first!)
        nodes.removeFirst()
        for value in nodes {
            let next = ListNode(value)
            next.next = result
            result = next
        }
        return result
    }
}
