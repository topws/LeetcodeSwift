//
//  IsValidBST.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/2.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 节点的左子树只包含 小于 当前节点的数。
 节点的右子树只包含 大于 当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 */
class IsValidBST {
    
    var pre: Int = Int.min
    
    func isValidBST(_ root: TreeNode?) -> Bool {

        if root == nil {
            return true
        }
        
        if (!isValidBST(root?.left)) {
            return false
        }
        
        if root!.val <= pre {
            pre = root!.val
            return false
        }
        
        return isValidBST(root?.right)
    }
    
    
    
//    // 使用中序遍历，遍历出来的结果是升序
//    let list = midumOrder(root);
//    // 判断是否是升序
//    if list.count <= 1 {
//        return true
//    }
//    var pre = list.first!
//    for item in list[1..<list.count] {
//        if item <= pre {
//            return false
//        }
//        pre = item
//    }
    
    func midumOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var res: [Int] = []
        res += midumOrder(root?.left)
        res.append(root!.val)
        res += midumOrder(root?.right)
        return res
    }
    
    // 使用递归，不断的更新 符合要求的区间
    func helper(_ root: TreeNode?, lower: Int, upper: Int) -> Bool {
        if root == nil {
            return true
        }
        // root.val 必须在满足需求的区间内
        if (root!.val <= lower || root!.val >= upper) {
            return false
        }
        // 递归，且更新区间
        return helper(root?.left, lower: lower, upper: root!.val) && helper(root?.right, lower: root!.val, upper: upper)
    }
    
    
}
