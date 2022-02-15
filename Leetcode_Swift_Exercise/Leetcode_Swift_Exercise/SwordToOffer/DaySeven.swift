//
//  DaySeven.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/24.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DaySeven {
//    输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)
//
//    B是A的子结构， 即 A中有出现和B相同的结构和节点值。
//    输入：A = [3,4,5,1,2], B = [4,1]
//    输出：true
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {

        if B == nil || A == nil {
            return false
        }
        if isEqual(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B){
            return true
        }
        return  false
    }
    
    func isEqual(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {return true}
        if A == nil || A!.val != B!.val {
            return false
        }
        return isEqual(A?.left, B?.left) && isEqual(A?.right, B?.right)
    }
    
    
//    请完成一个函数，输入一个二叉树，该函数输出它的镜像。
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil {return root}
        let _ = mirrorTree(root?.left)
        let _ = mirrorTree(root?.right)
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        return root
    }
    
    // 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
    
    // 根据特性去判断 左子树的左右结点 和 右子树的左右结点
    func isSymmetricByRecursive(_ root: TreeNode?) -> Bool {
        if root == nil {return true}
        return helpIsSymmetric(root?.left, root?.right)
    }
    
    func helpIsSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil || left?.val != right?.val {
            return false
        }
        return helpIsSymmetric(left?.left, right?.right) && helpIsSymmetric(left?.right, right?.left)
    }
    
    // 广度优先遍历，每次取当前层级的所有值
    func isSymmetric(_ root: TreeNode?) -> Bool {

        if root == nil {return true}
        var arr: [TreeNode] = [root!]
        while arr.count != 0 {
            var strArr: [String] = []
            var newTreeNodeArr: [TreeNode] = []
            for item in arr {
                if item.left == nil {
                    strArr.append(" ")
                } else {
                    strArr.append(String(item.left!.val))
                    newTreeNodeArr.append(item.left!)
                }
                if item.right == nil {
                    strArr.append(" ")
                } else {
                    strArr.append(String(item.right!.val))
                    newTreeNodeArr.append(item.right!)
                }
            }
            if !isSymmetricArray(strArr) {
                return false
            }
            arr = newTreeNodeArr
        }
        return true
    }
    
    func isSymmetricArray(_ arr: [String]) -> Bool {
        var left = 0
        var right = arr.count - 1
        while left < right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
}
