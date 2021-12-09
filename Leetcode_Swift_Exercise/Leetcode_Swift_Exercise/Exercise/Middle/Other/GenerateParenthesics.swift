//
//  GenerateParenthesics.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/6/24.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation
/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 
 例如，给出 n = 3，生成结果为：
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 */
class GenerateParenthesics {
    
    func generateParenthesis(_ n: Int) -> [String] {
        // 变成插入操作？
        
        return generateParenthesis(n - 1)
    }
}

