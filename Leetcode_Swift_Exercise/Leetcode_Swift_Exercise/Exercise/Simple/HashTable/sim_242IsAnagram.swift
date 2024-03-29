//
//  sim_242IsAnagram.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/29.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

  

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
  

 提示:

 1 <= s.length, t.length <= 5 * 104
 s 和 t 仅包含小写字母
  

 进阶: 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-anagram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class IsAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        // 创建一个字典，写入s值，再遍历t做移除
        var map:[String:Int] = [:]
        for c in s {
            map[String(c)] = map[String(c),default: 0] + 1
        }
        for c in t {
            guard let v = map[String(c)] else {
                return false
            }
            if v - 1 == 0 {
                map.removeValue(forKey: String(c))
            } else {
                map[String(c)] = v - 1
            }
        }
        return map.count == 0
    }
}
