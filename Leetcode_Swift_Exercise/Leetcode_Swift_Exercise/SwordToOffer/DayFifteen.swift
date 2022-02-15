//
//  DayFifteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/5.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayFifteen {}
// 二叉搜索树的第k大节点
extension DayFifteen {
    //给定一棵二叉搜索树，请找出其中第 k 大的节点的值。
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        // 记录K个值
        // 假定无重复的值
        if root == nil {return -1}
        
        var res: [Int] = []
        var waitSearch: [TreeNode] = [root!]
        while waitSearch.count > 0 {
            var new: [TreeNode] = []
            for item in waitSearch {
                res.append(item.val)
                if item.left != nil {
                    new.append(item.left!)
                }
                if item.right != nil {
                    new.append(item.right!)
                }
            }
            waitSearch = new
        }
        res.sort()
        return res[res.count - k]
    }
}

// 36. 二叉搜索树与双向链表
extension DayFifteen {
    // 无swift 校验
}

//二叉树中和为某一值的路径
extension DayFifteen {
    //给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。
    //叶子节点 是指没有子节点的节点。
    
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        if root == nil {return []}
        var res: [[Int]] = []
        var current: [Int] = []
        helper(root!, target, &res, &current)
        return res
    }
    
    func helper(_ root: TreeNode, _ target: Int, _ res: inout [[Int]], _ current: inout [Int]) {
        current.append(root.val)
        // 是否叶子
        if root.left == nil && root.right == nil {
            let sum = current.reduce(0) { partialResult, item in
                return item + partialResult
            }
            if sum == target {
                res.append(current)
            }
            current.removeLast()
            return
        }
        if root.left != nil {
            helper(root.left!, target, &res, &current)
        }
        if  root.right != nil {
            helper(root.right!, target, &res, &current)
        }
        current.removeLast()
    }
}
