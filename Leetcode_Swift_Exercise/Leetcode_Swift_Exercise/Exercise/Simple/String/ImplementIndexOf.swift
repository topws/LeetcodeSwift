//
//  ImplementIndexOf.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/23.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class ImplementIndexOf {
    func strStr(_ haystack: String, _ needle: String) -> Int {

        // needle 为"" ,返回0
        
        // 思路：相当于查找 haystack中连续出现的字符串，以目标字符串的首字母为起始，查找一一对的字符串，错误时，重新开始，直到haystack的结束
        if needle == "" {
            return 0
        }
        if haystack == "" {
            return -1
        }
        var targetIndex = 0
        // 单单记录一个index，对于一些特殊的场景几乎没有帮助（如：aaa....ab这种的）
        // 进一步挖掘该种方案，使用一个数组来记录？
        var backTrackingIndex = -1
        
        var index = 0
        while (index < haystack.count) {
            let c = haystack[haystack.index(haystack.startIndex, offsetBy: index)]
            
            if targetIndex > 0 && backTrackingIndex == -1 {
                // 已经找到起始位置了，记住这个位置
                if c == needle.first! {
                    backTrackingIndex = index
                }
            }
            // hello, ll
            if c == needle[needle.index(needle.startIndex, offsetBy: targetIndex)] {
                targetIndex += 1
                if targetIndex == needle.count {
                    // 完全相同
                    return index - needle.count + 1
                }
            } else {
                if targetIndex > 0 {
                    // 回溯
                    targetIndex = 0
                    if backTrackingIndex > -1 {
                        
                        //重启遍历
                        index = backTrackingIndex
                        backTrackingIndex = -1
                        continue
                    }
                }
            }
            index += 1
        }
        
        return -1
    }
}
