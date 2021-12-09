//
//  LevelOrder.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/5.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class LevelOrder {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        var res: [[Int]] = []
        var trees: [TreeNode] = []
        if root == nil {
            return []
        }
        res.append([root!.val])
        trees.append(root!)
        
        while trees.count > 0 {
            var newT: [TreeNode] = []
            var arr: [Int] = []
            for item in trees {
                if item.left != nil {
                    newT.append(item.left!)
                    arr.append(item.left!.val)
                }
                
                if item.right != nil {
                    newT.append(item.right!)
                    arr.append(item.right!.val)
                }
            }
            if arr.count > 0 {
                res.append(arr)
            }
            trees = newT
        }
        return res
    }
}
