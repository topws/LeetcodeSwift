//
//  ImplementIndexOf.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/23.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class ImplementIndexOf {
    
    //    输入：haystack = "hello", needle = "ll"
    //    输出：2
    
    // KMP 查找
    /*
     KMP 的核心思路是通过已经查询过的字符串信息，来让主串的遍历不回溯，而只是移动目标串的匹配下表。具体来讲，对于主串和目标串已经匹配了k个字符时，如果出现了k+1个字符不匹配时，那么就需要通过移动目标串的匹配下表，来继续匹配，这样就能保留主串已经移动了k个字符的结果。那么想要实现这种效果，就必须要知道目标串匹配下表需要移动的目的地，这里引入了一个新的概念，叫做前缀函数，前缀函数的是指当前字符串的真前缀和真后缀（子串不能是自身）能满足相等时的最长子串长度，比如AABCAAB，最长的就是AAB子串，那么这个字符串的前缀长度就是3.为什么要求这个前缀函数？我们可以发现前缀函数的要求是最后缀相等，这个特点有什么作用呢？他的作用就是帮助我们移动目标串的下表，已知我们已经匹配了k个字符，那么我们只要找到前面的k个字符的最长相同前后缀，也就是前缀函数，那么我们就可以直接移动目标串的下表，继续进行字符串相等匹配。
     */
    
    /*
     求前缀函数aabaab
     通过一次遍历，取各个子字符串的前缀函数值
     长度为1时，f(1)=0.
     f(n)=
     */
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" {return 0}
        if needle.count > haystack.count {return -1}
        if needle.count == haystack.count {return needle == haystack ? 0 : -1}
        
        var targetArr: [String] = []
        for c in needle {
            targetArr.append(String(c))
        }
        let next = createNextArr(targetArr)
        var j = 0//目标串的比对下表
        for (index,c) in haystack.enumerated() {
            while (j > 0 && targetArr[j] != String(c)) {
                j = next[j-1]
            }
            if targetArr[j] == String(c) {
                j += 1
            }
            if j == targetArr.count {
                return index + 1 - targetArr.count
            }
        }
        return -1
    }
    
    func createNextArr(_ patArr: [String]) -> [Int] {
        if patArr.count == 1 {return [0]}
        var nextArr: [Int] = Array.init(repeating: 0, count: patArr.count)
        for (index, c) in patArr[1...patArr.count-1].enumerated() {
            var pre = nextArr[index]
            while pre != 0 && patArr[pre] != String(c) {
                pre = nextArr[pre-1]
            }
            if patArr[pre] == String(c) {
                nextArr[index+1] = pre+1// 相等，长度+1
            }
        }
        
        return nextArr
    }
    
}
