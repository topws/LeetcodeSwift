//
//  mid_139wordSeprate.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/12.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
//s = "applepenapple", wordDict = ["apple", "pen"]
//apple pen apple -->true

/*
 官方题解：动态规划
 把一个很长的字符串，拆分为多个简单的子串
 整体字符串能拆分成目标字典中的单词，注意这里的拆分是连续的，所以一定会有多个分割点，可以完整的字符串拆分，那么问题就是如何找到分割点
 可以假设字符串的最后一个分割点j,那么这个J一定满足，J的后面就是字典中出现的单词，因为他是最后一个分割点，并且J前面的子串也一定是能被分割的，因为我们已经假设存在这个J了。那么可以得到一个动态规划的等式f(s) = f(s - j) && f(j)

 */

fileprivate class DoubleSideList {
    fileprivate var previous: DoubleSideList?
    fileprivate var next: DoubleSideList?
    fileprivate var start: Int = 0
    fileprivate var offset: Int = 0
    fileprivate var isHead: Bool = false
    fileprivate init(pre: DoubleSideList?,
                     next: DoubleSideList?,
                     start: Int,
                     offset: Int) {
        self.previous = pre
        self.next = next
        self.start = start
        self.offset = offset
    }
}
class WordBreak {
    func officialWordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        var dict: [String:Int]  = [:]
        for word in wordDict {
            dict[word] = 1
        }
        
        var res: [Bool] = Array.init(repeating: false, count: s.count + 1)
        res[0] = true
        for i in 1..<s.count+1 {
            // 查找是否有符合要求的分割点
            for j in 0..<i {
                let range: NSRange = NSMakeRange(j,i-j)
                let lastWord = (s as NSString).substring(with: range) as String
                if res[j] && dict[lastWord] != nil {
                    res[i] = true
                    break
                }
            }
        }
        return res[s.count]
    }
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {

        var maxLength = 0
        var dict: [String:Int]  = [:]
        for word in wordDict {
            dict[word] = 1
            maxLength = max(word.count, maxLength)
        }
        
        // 用一个双向链表来实现查找
        let listNode = DoubleSideList.init(pre: nil, next: nil, start: 0, offset: 0)
        let result = searchTarget(s,"",0, dict, maxL: maxLength)
        listNode.offset = result
        if result == s.count {
            return false
        }
        if listNode.offset == s.count - 1 {
            return true
        }
        // 创建一个头结点
        let headNode: DoubleSideList = DoubleSideList.init(pre: nil, next: listNode, start: 0, offset: 0)
        headNode.isHead = true
        listNode.previous = headNode
        
        var currentNode: DoubleSideList? = listNode
        // 开始查找下一层
        while currentNode != nil {
            var breakWord = ""
            var nextNodeStart = currentNode!.offset + 1
            if currentNode?.next != nil {
                // next 存在，说明已经找到过了，且不合符，需要从上一次的next继续找
                let nextNode = currentNode!.next
                // 存在前值 abcs
                let range: NSRange = NSMakeRange(nextNode!.start, nextNode!.offset - nextNode!.start + 1)
                breakWord = (s as NSString).substring(with: range) as String
                nextNodeStart = nextNode!.offset + 1
            }
            
            let newOffset = searchTarget(s,breakWord, nextNodeStart, dict, maxL: maxLength)
            
            if newOffset == s.count {
                // 没找到，回溯上一层
                currentNode = currentNode?.previous
                
            } else {
                // 下一层找到了
                if newOffset == s.count - 1 {
                    return true
                }
                var nextStart = currentNode!.offset + 1
                if currentNode!.isHead == true {
                    nextStart = 0
                }
                currentNode!.next = DoubleSideList.init(pre: currentNode!, next: nil, start: nextStart, offset: newOffset)
                currentNode = currentNode!.next
            }
        }
        
        return false
    }
    // 单次查找是否有目标值，返回目标值和剩余的字符串
    func searchTarget(_ s: String,_ baseStr: String,_ start: Int,_ wordDict: [String:Int], maxL: Int) -> Int {
        if s.count == 0 {
            return s.count
        }
        var breakWord = baseStr
        for i in start..<s.count {
            let c:Character = s[s.index(s.startIndex, offsetBy: i)]
            breakWord.append(c)
            if breakWord.count > maxL {
                return s.count
            }
            if wordDict[breakWord] != nil {
                // 找到目标值
                return i
            }
        }
        return s.count
    }
}
