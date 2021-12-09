//
//  mid_36ValidSudo.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/28.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 请你判断一个 9x9 的数独是否有效。只需要 根据以下规则 ，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
 数独部分空格内已填入了数字，空白格用 '.' 表示。
 
 注意：
 
 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-sudoku
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class IsValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var rows: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: 9), count: 9)
        var columns: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: 9), count: 9)
        var subboxes: [[[Int]]] = Array.init(repeating: Array.init(repeating: Array.init(repeating: 0, count: 9), count: 3), count: 3)
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j];
                if (c != ".") {
                    let index = Int(String(c))! - 1;
                    rows[i][index] += 1
                    columns[j][index] += 1
                    subboxes[i / 3][j / 3][index] += 1
                    
                    if (rows[i][index] > 1 || columns[j][index] > 1 || subboxes[i / 3][j / 3][index] > 1) {
                        return false;
                    }
                }
            }
        }
        
        return true
        
        
        //        for (_, value) in board.enumerated() {
        //            var map: [Character:Int] = [:]
        //            for (_, c) in value.enumerated() {
        //                if judgeIsExsit(map: &map, c: c) {
        //                    return false
        //                }
        //            }
        //        }
        //
        //        for j in 0...8 {
        //            var map: [Character:Int] = [:]
        //            for i in 0...8 {
        //                let c = board[i][j]
        //                if judgeIsExsit(map: &map, c: c) {
        //                    return false
        //                }
        //            }
        //        }
        //
        //        for i in 0..<9 {
        //            // 9个目标数独，但是i,j要根据这个算出来
        //            var map: [Character:Int] = [:]
        //            for j in 0..<9 {
        //                let row = i / 3 * 3 + j / 3
        //                let col = i % 3 * 3 + j % 3
        //                let c = board[row][col]
        //                if judgeIsExsit(map: &map, c: c) {
        //                    return false
        //                }
        //            }
        //        }
        //        return true
    }
    
    func judgeIsExsit(map: inout [Character:Int],c: Character) -> Bool{
        if c == "." {
            return false
        }
        if map[c] != nil {
            return true
        }
        map[c] = 1
        return false
    }
    
    func mutibleMap(_ board: [[Character]]) -> Bool {
        // 三个条件均要满足
        // 可以假设 建立多个字典？9 * 3个字典 OR 一个字典 遍历 9 * 3次
        var maps: [[Character:Int]] = []
        for _ in 0...26 {
            let map:[Character:Int] = [:]
            maps.append(map)//行，列，3*3
        }
        for (i, value) in board.enumerated() {
            for (j, c) in value.enumerated() {
                if c == "." {
                    continue
                }
                if maps[i][c] != nil {
                    return false
                } else {
                    maps[i][c] = 1
                }
                
                if maps[9+j][c] != nil {
                    return false
                } else {
                    maps[9+j][c] = 1
                }
                
                if maps[18+(j/3 + i/3*3)][c] != nil {
                    return false
                } else {
                    maps[18+(j/3 + i/3*3)][c] = 1
                }
            }
        }
        return true
    }
}
