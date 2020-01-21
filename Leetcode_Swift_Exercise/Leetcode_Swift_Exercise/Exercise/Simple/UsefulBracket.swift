//
//  UsefulBracket.swift
//  Leetcode_Swift_Exercise
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import Foundation

/*
 * "给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。有效字符串需满足：左括号必须用相同类型的右括号闭合。左括号必须以正确的顺序闭合。注意空字符串可被认为是有效字符串。"
 */

class UsefulBracket {
    func isValid(_ s: String) -> Bool {
        if s.count < 2 {
            return false
        }
        // 去空格(可以 优化 不用去除空格)
        var str = s
        str = s.replacingOccurrences(of: " ", with: "")
        while str.contains("()") || str.contains("[]") || str.contains("{}") {
            str = str.replacingOccurrences(of: "{}", with: "")
            str = str.replacingOccurrences(of: "[]", with: "")
            str = str.replacingOccurrences(of: "()", with: "")
        }
        
        return str.count == 0

    }

}
