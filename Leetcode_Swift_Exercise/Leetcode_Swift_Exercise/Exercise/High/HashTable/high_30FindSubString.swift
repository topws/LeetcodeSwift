//
//  FindSubString.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/20.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import Foundation

/*
 
 30. 串联所有单词的子串
 
 给定一个字符串 s 和一些 长度相同 的单词 words 。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。

 注意子串要与 words 中的单词完全匹配，中间不能有其他字符 ，但不需要考虑 words 中单词串联的顺序。

  

 示例 1：

 输入：s = "barfoothefoobarman", words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 示例 2：

 输入：s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 输出：[]
 示例 3：

 输入：s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 输出：[6,9,12]
  

 提示：

 1 <= s.length <= 104
 s 由小写英文字母组成
 1 <= words.length <= 5000
 1 <= words[i].length <= 30
 words[i] 由小写英文字母组成
 
 题解：
 记 s 中，任一个长度为 words 中元素长度的子串，为一个窗口
 解题步骤如下：

 使用哈希表记录 words 里面元素的个数，两个作用：1)判断words中是否存在某子串；2)判断words中某子串的个数
 判断第一个字母开始的窗口是否存在于words里
 若存在：对窗口进行 n 次( n 等于 words 里元素个数)移动，对每一个窗口进行判断，若该窗口子串存在且其个数大于 0，认为该窗口匹配成功，将其个数减 1，窗口向后移动一个步长
 若 n 次窗口都匹配成功，将 i 的值放入ans
 对 s 的后续字母重复第 2.3.4 步


 作者：climite
 链接：https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words/solution/6bu-jie-jue-kun-nan-ti-ji-xiang-xi-dai-m-ohv6/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class FindSubString {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        // 关键信息，每个单词的长度是相同的。又words组成的长度也是固定的，所有有了对应长度的子串后，子串中单词是固定的
        let singleWordL = words.first!.count
        let targetL = words.count * singleWordL
        let endIndex = s.count - targetL
        var resultIndex: [Int] = []
        if endIndex < 0 {
            return []
        }
        
        var wordDict: [String:Int] = [:]
        for word in words {
            let count = wordDict[word] ?? 0
            wordDict[word] = count + 1
        }
        
        for index in 0...endIndex {
            let targetSubstring = (s as NSString).substring(with: NSMakeRange(index, targetL))
            // 有了对应长度的子串，从索引0开始算，加上固定长度对应固定的一个word
            var wordDictTemp:[String:Int] = [:]
            
            for wordIndex in 0..<words.count {
                let subWord = (targetSubstring as NSString).substring(with: NSMakeRange(wordIndex * singleWordL, singleWordL))
                let count = wordDictTemp[subWord] ?? 0
                wordDictTemp[subWord] = count + 1
            }
            if wordDictTemp == wordDict {
                // 是目标
                resultIndex.append(index)
            }
        }
        
        return resultIndex
    }
    
    func sortFind(_ s: String, _ words: [String]) -> [Int] {
        //先对所有的单词找出对应的位置，然后对位置进行排序，如果能连起来就说明是有效的
        var wordCount: [String:Int] = [:]
        var ranges: [NSRange] = []
        
        for item in words {
            let count:Int = wordCount[item] != nil ? (wordCount[item]!) : 0;
            wordCount[item] = count + 1
            if count > 0 {
                // 已经算过了
                continue
            }
            let indexs:[Int] = searchIndex(s: s, subString: item)
            if indexs.count == 0 {
                return []
            }
            for index in indexs {
                if !ranges.contains(NSMakeRange(index, item.count)) {
                    ranges.append(NSMakeRange(index, item.count))
                }
            }
        }
        ranges = ranges.sorted(by: { a, b in
            return a.location < b.location
        })
        // 排序后的Range，按照words的长度来说，最多有ranges.count - words.count 个，取出所有的场景，然后查看是否是连续的
        if ranges.count < words.count {
            return []
        }
        let sortedRangeCount = ranges.count - words.count
        
        var resultIndex: [Int] = []
        for sortedRangeIndex in 0...sortedRangeCount {
            let subSortedRanges = ranges[sortedRangeIndex...(sortedRangeIndex + words.count - 1)]
            
            var previousIndex = -1
            // 取所有的word
            var allSortedWord: [String:Int] = [:]
            
            for subSortedRange in subSortedRanges {
                let sortedWord:String = (s as NSString).substring(with: subSortedRange) as String
                let originalCount = allSortedWord[sortedWord] != nil ? allSortedWord[sortedWord]! : 0
                allSortedWord[sortedWord] = originalCount + 1
                
                if previousIndex == -1 || previousIndex == subSortedRange.location {// 是连续的
                    previousIndex = subSortedRange.location + subSortedRange.length
                } else {
                    previousIndex = -1;
                    break
                }
            }
            if previousIndex == -1 {
                continue
            }
            // 符合连续de range
            // 每个word使用的次数是对的，则符合目标
            var isEqual: Bool = true
            for sortedWordItem in allSortedWord {
                if wordCount[sortedWordItem.key] != sortedWordItem.value {
                    isEqual = false
                    break
                }
            }
            if isEqual {
                resultIndex.append(subSortedRanges.first!.location)
            }
        }
        return resultIndex
    }
    
    func searchIndex(s: String,subString: String) -> [Int] {
        var temp = s
        var result: [Int] = []
        while (true) {
            let range:NSRange = (temp as NSString).range(of: subString, options: NSString.CompareOptions.backwards)
            if range.location == NSNotFound {
                return result
            }
            result.append(range.location)
            //只替换最后一个字符
            let replaceRange:NSRange = NSMakeRange(range.location + range.length - 1, 1)
            temp = (temp as NSString).replacingCharacters(in: replaceRange, with: "") as String
        }
        return result
    }
    
    
    
    
    
    
    
    // 暴力遍历，枚举所有的子单词组成的新单词_
    func errorFunc(_ s: String, _ words: [String]) -> [Int] {
        var originalInde: [Int] = []
        for i in 0..<words.count {
            originalInde.append(i)
        }
        let indexs = getAllPermutation(indexs: originalInde)
        var resultIndex: [Int] = []
        
        for indexArr in indexs {
            
            var subString: String = ""
            for index in indexArr {
                // 拼字符串
                subString.append(words[index])
            }
            // 查找是否存在且返回index
            let currentResult = searchIndex(s: s, subString: subString)
            if currentResult.count > 0 {
                resultIndex.append(contentsOf: currentResult)
            }
        }
        
        resultIndex = resultIndex.enumerated().filter({ (index,value)->Bool in
            return resultIndex.firstIndex(of: value) == index
        }).map{
            $0.element
        }
        return resultIndex
    }
    func getAllPermutation(indexs: [Int]) -> [[Int]] {
        // 每一轮的循环会多出多个排列后的组合，每轮循环从offset 开始，不断的交替offset 和后面的内容，得到新的组合，当offset 到最后一个时，无法交换，循环停止
        var resultArr:[[Int]] = [indexs]
        
        for offset in 0..<indexs.count {
            var newResultArr:[[Int]] = []
            // 结果数组中的每一个结果都需要交换
            for tempArr in resultArr {
                // 对object 进行交换
                var mutableTempArr = tempArr
                for i in offset..<indexs.count {
                    let tempObject = mutableTempArr[offset]
                    mutableTempArr[offset] = mutableTempArr[i]
                    mutableTempArr[i] = tempObject
                    
                    newResultArr.append(mutableTempArr)
                }
            }
            // 得到新的排列数组
            resultArr = newResultArr
        }
        
        return resultArr
    }
}
