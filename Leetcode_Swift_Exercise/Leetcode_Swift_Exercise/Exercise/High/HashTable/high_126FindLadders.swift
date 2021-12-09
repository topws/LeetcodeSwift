//
//  high_126FindLadders.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/31.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 按字典 wordList 完成从单词 beginWord 到单词 endWord 转化，一个表示此过程的 转换序列 是形式上像 beginWord -> s1 -> s2 -> ... -> sk 这样的单词序列，并满足：

 每对相邻的单词之间仅有单个字母不同。
 转换过程中的每个单词 si（1 <= i <= k）必须是字典 wordList 中的单词。注意，beginWord 不必是字典 wordList 中的单词。
 sk == endWord
 给你两个单词 beginWord 和 endWord ，以及一个字典 wordList 。请你找出并返回所有从 beginWord 到 endWord 的 最短转换序列 ，如果不存在这样的转换序列，返回一个空列表。每个序列都应该以单词列表 [beginWord, s1, s2, ..., sk] 的形式返回。

 示例 1：

 输入：beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 输出：[["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
 解释：存在 2 种最短的转换序列：
 "hit" -> "hot" -> "dot" -> "dog" -> "cog"
 "hit" -> "hot" -> "lot" -> "log" -> "cog"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-ladder-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-ladder-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class FindLadders {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {

        // 找到每个词对应的 相邻词
        // n * logn
        var ladderDict: [String:[String]] = [:]
        var wordKeys: [String:Int] = [:]
        for i in 0..<wordList.count {
            
            wordKeys[wordList[i]] = 1
            if isLadder(beginWord, wordList[i]) {
                var iLadders: [String] = ladderDict[beginWord, default: []]
                iLadders.append(wordList[i])
                ladderDict[beginWord] = iLadders
            }
            
            for j in i..<wordList.count {
                if wordList[i] == wordList[j] {
                    continue
                }
                if isLadder(wordList[i], wordList[j]) {
                    // 写入
                    var iLadders: [String] = ladderDict[wordList[j], default: []]
                    iLadders.append("")
                    ladderDict[wordList[i]] = iLadders
                        
                    var jLadders = ladderDict[wordList[j], default: []]
                    jLadders.append(wordList[i])
                    ladderDict[wordList[j]] = jLadders
                }
            }
        }
        // 从begin 开始找，先去掉最后一个单词
        guard let _ = wordKeys[endWord] else {
            return []
        }
        
        var nextWord = beginWord
        var ladders: [String] = ladderDict[nextWord, default: []]
        var results: [[String]] = []
        while (ladders.count > 0) {
            
            // 后面就是开始遍历查找
            // 由于要返回所有的最短路径，相当于可能需要多个结果所以需要广度优先遍历
            // 由于要返回最短的，所以需要进行深度遍历，查找最短的结果
            // 结合到这题就是，如果某一个结点已经在上层的遍历中出现了，后面再由于子结点指向该上层结点时，应该放弃搜索，因为他一定不是最短的了，
        }
        
        return []
    }
    
    func isLadder(_ a:String, _ b: String) -> Bool {
        var cDict: [Character:Int] = [:]
        for c in a {
            cDict[c] = cDict[c, default: 0] + 1
        }
        for c in b {
            if let v = cDict[c] {
                if v - 1 == 0 {
                    cDict.removeValue(forKey: c)
                } else {
                    cDict[c] = v - 1
                }
            }
        }
        return cDict.count == 1
    }
}
