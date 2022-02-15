//
//  DayTwenty.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/13.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayTwenty {}

//二叉搜索树的后序遍历序列
extension DayTwenty {
    //输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        if postorder.count < 2 {return true}
        // 思路：[[left][right]root]
        // root 比left 都大，比right 都小
        let rootVal = postorder.last!
        var isBeginRight = false
        var leftCount = 0
        for item in 0...postorder.count-2 {
            let value = postorder[item]
            if isBeginRight == false {
                // 左边
                if value < rootVal {
                    continue
                } else {
                    leftCount = item
                    isBeginRight = true
                }
            } else {
                // 已经是开始右子树了
                if value > rootVal {
                    continue
                } else {
                    return false
                }
            }
        }
        // 这里的数组应该优化，可以用下表的方式来代替
        var res = true
        if leftCount > 0 {
            res = res && verifyPostorder(Array(postorder[0...leftCount-1]))
        }
        if res == false {
            return false
        }
        
        if postorder.count - 1 - leftCount > 0 {
            res = res && verifyPostorder(Array(postorder[leftCount...postorder.count-2]))
        }
        
        return res
    }
}

//数值的整数次方
extension DayTwenty {
    //实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。不得使用库函数，同时不需要考虑大数问题。
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if (n == 0) {return 1}
        let half = myPow(x, n / 2);
        return n % 2 == 0 ? half * half : half * half * (n > 0 ? x : 1 / x)
    }
}

//07. 重建二叉树
extension DayTwenty {
    // 输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。
    
    // 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {return nil}
        // 构造中序遍历的 健值索引
        var dict: [Int : Int] = [:]
        for (index,item) in inorder.enumerated() {
            dict[item] = index
        }
        // 前序遍历能够取到 根节点，根据根节点再去 获取左右子树的 中序遍历和前序遍历的数组
        let rootIndex = dict[preorder.first!]!
        let rootNode: TreeNode = TreeNode.init(preorder.first!)
        // 左子树的数量为 rootIndex
        var leftNode: TreeNode?
        if rootIndex > 0 {
            let leftPreorder = Array(preorder[1...rootIndex-1+1])
            let leftInorder = Array(inorder[0...rootIndex-1])
            leftNode = buildTree(leftPreorder, leftInorder)
        }
        // 右子树的数量为
        let rightCount = preorder.count - 1 - rootIndex
        var rightNode: TreeNode?
        if rightCount > 0 {
            let rightPreoder = Array(preorder[rootIndex+1...preorder.count-1])
            let rightInorder = Array(inorder[rootIndex+1...preorder.count-1])
            rightNode = buildTree(rightPreoder, rightInorder)
        }
        rootNode.left = leftNode
        rootNode.right = rightNode
        return rootNode
    }
}
