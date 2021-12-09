//
//  RevertString.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/22.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

  

 示例 1：

 输入：s = ["h","e","l","l","o"]
 输出：["o","l","l","e","h"]

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnhbqj/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class RevertString {
    func reverseString(_ s: inout [Character]) {
       
        for i in (0..<s.count / 2) {
            let temp = s[i]
            s[i] = s[s.count - 1 - i]
            s[s.count - i] = temp
        }
        
    }
    
    /*
    给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

    说明：本题中，我们将空字符串定义为有效的回文串。*/
    func isPalindrome(_ s: String) -> Bool {

        var arr: [Character] = []
        for c in s {
            if !c.isASCII {
                continue
            }
            
            if c.isNumber || c.isLetter {
                arr.append(c)
            }
        }
            for i in (0..<arr.count / 2) {
                if (arr[i].lowercased() !=  arr[arr.count - 1 - i].lowercased()) {
                    return false
                }
            }
        return true
        }
    
    
}
