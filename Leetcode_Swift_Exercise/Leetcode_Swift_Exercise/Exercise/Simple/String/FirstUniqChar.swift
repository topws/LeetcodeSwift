//
//  FirstUniqChar.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/22.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

  

 示例：

 s = "leetcode"
 返回 0

 s = "loveleetcode"
 返回 2

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xn5z8r/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

class FirstUniqChar {
    func firstUniqChar(_ str: String) -> Int {
        var dict: [Character:Int] = [:]
        for c in str {
            dict[c] = dict[c,default: 0] + 1
        }
        for (index,c) in str.enumerated() {
            if dict[c] == 1 {
                return index
            }
        }
        return -1
    }
}
