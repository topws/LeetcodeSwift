//
//  mid_49GroupAnagrams.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/29.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。

 字母异位词 是由重新排列源单词的字母得到的一个新单词，所有源单词中的字母都恰好只用一次。

  

 示例 1:

 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 示例 2:

 输入: strs = [""]
 输出: [[""]]
 示例 3:

 输入: strs = ["a"]
 输出: [["a"]]
  

 提示：

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] 仅包含小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/group-anagrams
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        // 如何创建一个key?,转为ascii码？
        var result:[String:[String]] = [:]
        for str in strs {
            let key = str.sorted().reduce("") { partialResult, c in
                return partialResult + String(c)
            }
            var targets = result[key, default: []]
            targets.append(str)
            result[key] = targets
        }
        return Array.init(result.values)
    }
}
