//
//  MaxDepth.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/1.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class MaxDepth {
    func maxDepth(_ root: TreeNode?) -> Int {

        // 广度遍历，把每一层的结点，推入数组中
        if root == nil {
            return 0
        }
        var result = 0
        var nodeArr: [TreeNode] = [root!]
        while nodeArr.count != 0 {
            result += 1
            // 推入下一层的结点
            var new: [TreeNode] = []
            for node in nodeArr {
                if node.left != nil {
                    new.append(node.left!)
                }
                if node.right != nil {
                    new.append(node.right!)
                }
            }
            nodeArr = new
        }
        
        return result
    }
    /*递归
    if root == nil {
        return 0
    }
    return max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
     */
}
