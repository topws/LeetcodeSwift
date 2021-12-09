//
//  mid_73SetZero.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/31.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个 m x n 的矩阵，如果一个元素为 0 ，则将其所在行和列的所有元素都设为 0 。请使用 原地 算法。

 进阶：

 一个直观的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 你能想出一个仅使用常量空间的解决方案吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/set-matrix-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class SetZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {

        
        let rows = matrix.count
        let cols: Int = matrix.first?.count ?? 0
        var zeros: [Bool] = Array.init(repeating: false, count: rows + cols)
        // m + n个字典
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 0 {
                    zeros[i] = true
                    zeros[rows + j] = true
                }
            }
        }
        // 开始置空
        for (i,isZero) in zeros.enumerated() {
            if !isZero {
                continue
            }
            if i < rows {
                // 行
                for j in 0..<cols {
                    matrix[i][j] = 0
                }
                continue
            }
            // 列
            for row in 0..<rows {
                matrix[row][i - rows] = 0
            }
        }
    }
}
