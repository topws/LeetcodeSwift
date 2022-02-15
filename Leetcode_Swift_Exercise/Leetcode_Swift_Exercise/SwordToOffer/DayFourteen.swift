//
//  DayFourteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/4.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DayFourteen{}

//13.机器人的运动范围
extension DayFourteen {
//    地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？
//    输入：m = 2, n = 3, k = 1
//    输出：3
    
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        // 根据机器人可触及的移动规律可以证明，机器人只向右向下时，可以走到任意一个能触及的方格，所以递归的方向就是计算向右向下是否有值
        var visited:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        return helper(&visited, k, 0, 0,m,n)
    }
    
    func helper(_ visited: inout [[Bool]], _ k: Int,_ i: Int, _ j: Int,_ m: Int,_ n: Int) -> Int {
        if i >= m || j >= n || visited[i][j]{
            return 0
        }
        let sum = i / 10 + i % 10 + j / 10 + j % 10
        if sum > k {
            return 0
        }
        visited[i][j] = true
        return 1 + helper(&visited, k, i + 1, j, m, n) + helper(&visited, k, i, j + 1, m, n)
    }
    
}

//12.矩阵中的路径
extension DayFourteen {
//    给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。
//
//    单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        var words: [Character] = []
        for c in word {
            words.append(c)
        }
        for (i,item) in board.enumerated() {
            for (j,c) in item.enumerated() {
                if helper(&board, words, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func helper(_ board: inout[[Character]], _ word: [Character], _ i: Int, _ j: Int,_ k: Int) -> Bool {
        if i >= board.count ||
            i < 0 ||
            j >= board[0].count ||
            j < 0 ||
            k >= word.count{
            return false
        }
        if word[k] != board[i][j] {
            return false
        }
        if k == word.count - 1 {
            return true
        }
        let temp = board[i][j]
        board[i][j] = Character.init("_")
        let res = helper(&board, word, i + 1, j, k + 1) || helper(&board, word, i - 1, j, k + 1) ||
        helper(&board, word, i, j + 1, k + 1) ||
            helper(&board, word, i, j - 1, k + 1)
        board[i][j] = temp
        return res
    }
    
}
