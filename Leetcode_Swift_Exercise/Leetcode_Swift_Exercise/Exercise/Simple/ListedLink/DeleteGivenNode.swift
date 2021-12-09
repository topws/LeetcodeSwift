//
//  DeleteGivenNode.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/26.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class DeleteGivenNode {
    // 删除指定 的结点，但是给的是被删除的结点
    // 通常来说，找到要被删除的结点的上一个结点，就能轻易的删除，但是这里找不到，并且next不为空，所以可以采用交换结点的方式
    func deleteNode(_ node: ListNode?) {
            
        if node == nil {
            return
        }
        node!.val = node!.next!.val
        node!.next = node!.next!.next    
    }
}
