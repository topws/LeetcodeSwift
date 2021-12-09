//
//  sim_290wordPattern.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/27.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import Foundation
/*
 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。

 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。

 示例1:

 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:

 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:

 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:

 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-pattern
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class SIMWordPattern {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {

        let strs: [String] = s.components(separatedBy: " ")
        if strs.count != pattern.count {
            return false
        }
        // pattern的value 作为key,s 分割的单词作为value
        // error: 单s的单词，会遗漏个需求，abba这种，不仅要求a和a对应，还要求a和b不同
        var hashTable: [String:String] = [:]
        var sHash: [String:String] = [:]//value对应的key也不能相同
        for (index,value) in pattern.enumerated() {
            if let hashValue = hashTable[String(value)] {
                if hashValue != strs[index] {
                    return false
                }
            } else {
                // 首次不存在key，说明是第一次遇到这个pattern，那么这里要求不同的pattern,对应的value 必须不同
                let sValue = sHash[strs[index]]
                if sValue == nil {
                    // 不存在则，直接写入
                    sHash[strs[index]] = "1"
                } else {
                    // 已存在了。说明不合需求
                    return false
                }
                hashTable[String(value)] = strs[index]
            }
        }
        
        return true
    }
}
