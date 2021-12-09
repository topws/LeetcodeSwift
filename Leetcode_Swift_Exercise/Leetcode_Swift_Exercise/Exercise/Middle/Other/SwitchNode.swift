//
//  SwitchNode.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/7/15.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
   
 
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 */

class SwitchNode {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        
        // 创建一个 元结点，方便进行指针的操作，node.next = node.next?.next
        let dummy: ListNode? = ListNode.init(0)
        dummy?.next = head
        
        
        var first = dummy
        
        // 移动指针
        while first?.next != nil,first?.next?.next != nil {
            
            // 需要断开这两个结点
            let suf = first?.next?.next?.next
            first?.next?.next?.next = nil
            
            let waitSwitch = first?.next
            first?.next = nil
            
            
            let sufSwitch = waitSwitch?.next
            waitSwitch?.next = nil
            
            // 然后重新拼接
            waitSwitch?.next = suf
            sufSwitch?.next = waitSwitch
            first?.next = sufSwitch
            
           
            
            //迁移完成后，q向前两个结点
            first = first?.next
            first = first?.next
        }
        
        return dummy?.next
    }
}
