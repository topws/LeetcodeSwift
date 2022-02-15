//
//  DayEighteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/13.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayEighteen {}

// I:二叉树的深度
extension DayEighteen {
    
    //输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}

// II. 平衡二叉树
extension DayEighteen {
    //输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
    func isBalanced(_ root: TreeNode?) -> Bool {
        let tuple = helpIsBalance(root)
        return tuple.1
    }

    func helpIsBalance(_ root: TreeNode?) -> (Int, Bool){
        if root == nil {
            return (0, true)
        }
        let left = helpIsBalance(root?.left)
        let right = helpIsBalance(root?.right)
        if left.1 == false || right.1 == false {
            return (0, false)
        }
        if abs(left.0 - right.0) > 1 {
            return (0, false)
        }
        return ((1 + max(left.0, right.0)), true)
    }
    
    /*
    // 官方优秀解法(和我的解法其实一样)：
    func isBalanced(_ root: TreeNode?) -> Bool {
        return helpIsBalanced(root) >= 0
    }
    
    func helpIsBalanced(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        
        let left = helpIsBalanced(root?.left)
        let right = helpIsBalanced(root?.right)
        if left == -1 || right == -1 || (abs(left - right) > 1) {
            return -1
        }
        return 1 + max(left, right)
    }
     */
}
