//
//  DayThree.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/3.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
//请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
//输入：s = "We are happy."
//输出："We%20are%20happy."
class DayThree {
    func replaceSpace(_ s: String) -> String {
        var res = ""
        for c in s {
            if c == " " {
                res.append("%20")
            } else {
                res.append(String(c))
            }
        }
        return res
    }
    
//    字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
//
//    输入: s = "abcdefg", k = 2
//    输出: "cdefgab"
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        
        var res = ""
        var trail = ""
        for (index,c) in s.enumerated() {
            if index < n {
                trail.append(c)
            } else {
                res.append(c)
            }
        }
        return res.appending(trail)
    }
}
