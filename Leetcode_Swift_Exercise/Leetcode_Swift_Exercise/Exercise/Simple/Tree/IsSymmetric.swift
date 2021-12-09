//
//  IsSymmetric.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/3.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class isSymmetric {
    func isSymmetric(_ root: TreeNode?) -> Bool {

        if root == nil {
            return true
        }
        return helper(root?.left, root?.right)
    }
    
    func helper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        return helper(left?.left, right?.right) && helper(left?.right, right?.left)
    }

}
