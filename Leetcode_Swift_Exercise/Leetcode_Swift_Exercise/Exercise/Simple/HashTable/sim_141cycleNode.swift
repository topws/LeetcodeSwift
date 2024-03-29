//
//  sim_141cycleNode.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/12.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import Foundation
/**
 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 如果链表中存在环，则返回 true 。 否则，返回 false 。

  

 进阶：

 你能用 O(1)（即，常量）内存解决此问题吗？

  

 示例 1：



 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 示例 2：



 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 示例 3：



 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。
  

 提示：

 链表中节点的数目范围是 [0, 104]
 -105 <= Node.val <= 105
 pos 为 -1 或者链表中的一个 有效索引 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/linked-list-cycle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 [-21,10,17,8,4,26,5,35,33,-7,-16,27,-12,6,29,-12,5,9,20,14,14,2,13,-24,21,23,-21,5]
 [3,2,0,-4] 1
 */
class CycleNodeSolution {
    func hasCycle(_ head: ListNode?) -> Bool {
//        var newHead = head
//        while newHead != nil {
//            if newHead?.val == 95279527 {
//                return true
//            } else {
//                newHead?.val = 95279527
//            }
//            newHead = newHead?.next
//        }
//        return false
        /*
            快慢指针
         */
        
        let newHead = head
        var slow = newHead
        var fast = newHead?.next
        while fast != nil {
            if slow == nil || fast == nil {
                return false
            }
            
            var fastMemory: Int64 = 0;
            var slowMemory: Int64 = 0;
            withUnsafePointer(to: &fast) { ptr in
                fastMemory = unsafeBitCast(ptr.pointee, to: Int64.self)
            }
            withUnsafePointer(to: &slow) { ptr in
                slowMemory = unsafeBitCast(ptr.pointee, to: Int64.self)
            }
            if fastMemory == slowMemory {
                return true
            }

            // 快慢指针
            slow = slow?.next
            if fast?.next == nil {
                return false
            }
            fast = fast?.next?.next
        }
        return false
        
        /* 字典存储，空间换时间
        guard var strongHead = head else {
            return false
        }
        var dict:[Int64:Int] = [:]
        while (strongHead.next != nil) {
            var nextNode:ListNode = strongHead.next!
            var memoryPointer: Int64 = 0
            withUnsafePointer(to: &nextNode) { ptr in
                memoryPointer = unsafeBitCast(ptr.pointee, to: Int64.self)
            }
            
            if let _ = dict[memoryPointer] {
                return true
            }
            
            strongHead = strongHead.next!
            
           
            dict[memoryPointer] = 1
        }
        return false
        */
    }
}
