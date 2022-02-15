//
//  DaySix.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/23.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DaySix {
    //从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var waitPrint: [TreeNode] = [root!]
        var res: [Int] = []
        while waitPrint.count != 0 {
            // 每次取first 即可保证打印顺序
            let first = waitPrint.removeFirst()
            res.append(first.val)
            if first.left != nil {
                waitPrint.append(first.left!)
            }
            if first.right != nil {
                waitPrint.append(first.right!)
            }
        }
        return res
    }
    //从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
    // 返回的是 [[Int]]
    func levelOrderTwo(_ root: TreeNode?) -> [[Int]] {
        // 记录一下每次需要Pop 的个数
        if root == nil {
            return []
        }
        var waitPrint: [TreeNode] = [root!]
        var res: [[Int]] = []
        var waitPopCount: Int = 1// 计算的次数
        while waitPrint.count != 0 {
            var singleLevel: [Int] = []
            var newPopCount = 0
            for item in waitPrint[0...waitPopCount-1] {
                singleLevel.append(item.val)
                if item.left != nil {
                    newPopCount += 1
                    waitPrint.append(item.left!)
                }
                if item.right != nil {
                    newPopCount += 1
                    waitPrint.append(item.right!)
                }
            }
            waitPrint.removeSubrange(Range<Int>.init(NSMakeRange(0, waitPopCount))!)
            res.append(singleLevel)
            waitPopCount = newPopCount
        }
        return res
        
    }
    // 变形2： 打印 之 型
    func levelOrderThree(_ root: TreeNode?) -> [[Int]] {
        // 记录一下每次需要Pop 的个数
        if root == nil {
            return []
        }
        var waitPrint: [TreeNode] = [root!]
        var res: [[Int]] = []
        var waitPopCount: Int = 1// 计算的次数
        var appendLeft: Bool = true//左右左
        while waitPrint.count != 0 {
            var singleLevel: [Int] = []
            var newPopCount = 0
            for item in waitPrint[0...waitPopCount-1] {
                
                singleLevel.append(item.val)
                if item.left != nil {
                    newPopCount += 1
                    waitPrint.append(item.left!)
                }
                if item.right != nil {
                    newPopCount += 1
                    waitPrint.append(item.right!)
                }
            }
            waitPrint.removeSubrange(Range<Int>.init(NSMakeRange(0, waitPopCount))!)
            res.append(appendLeft ? singleLevel : singleLevel.reversed())
            appendLeft = !appendLeft
            waitPopCount = newPopCount
        }
        return res
        
    }
}
