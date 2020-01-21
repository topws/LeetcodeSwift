//
//  File.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/7/13.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation


class CreateListNodeByArray {
    // 1,2,3,4 -> ListNode (1->2->3->4)
    static func createListNodeByArray(arr: [Int]) -> ListNode? {
    
        if arr.count == 0 {return nil}
        var nodes: [Int] = arr.reversed()
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
