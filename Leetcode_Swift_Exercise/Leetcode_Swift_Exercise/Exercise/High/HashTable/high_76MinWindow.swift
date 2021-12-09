//
//  high_76MinWindow.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/10/29.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

  

 注意：

 对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
 如果 s 中存在这样的子串，我们保证它是唯一的答案。
  

 示例 1：

 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 示例 2：

 输入：s = "a", t = "a"
 输出："a"
 示例 3:

 输入: s = "a", t = "aa"
 输出: ""
 解释: t 中两个字符 'a' 均应包含在 s 的子串中，
 因此没有符合条件的子字符串，返回空字符串。
  

 提示：

 1 <= s.length, t.length <= 105
 s 和 t 由英文字母组成
  

 进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-window-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class MinWindow {
    func minWindow(_ s: String, _ t: String) -> String {
    
        // 滑动窗口，因为是连续的字段，可以用滑动窗口解决。对比下面超时的遍历逻辑，滑动窗口能够把已处理过的内容 不用重复处理
        if s.count < t.count {
            return ""
        }
        if t.count == 1 && s.contains(t) {
            return t
        }
        var countMap: [String:Int] = [:]
        for c in t {
            countMap[String(c)] = countMap[String(c), default: 0] + 1
        }
    
        // i ,j
        var i :Int = 0// 左边界
        var j: Int = 0// 右边界
        var target: [Int] = [0,s.count-1]
        var isFind: Bool = false
        while (j < s.count) {
            let key = (s as NSString).substring(with: NSMakeRange(j, 1))
            let exsit = countMap[key]
            if exsit == nil {
                j += 1
                continue
            }
            countMap[key] = exsit! - 1
            // 判断是否全空,全空则是目标值
            if (j - i + 1 >= t.count) && isAllValueIsZero(countMap) {
                if j - i + 1 == t.count {
                    target = [i,j]
                    let range:NSRange = NSMakeRange(target.first!, target.last! - target.first! + 1)
                    return (s as NSString).substring(with: range)
                }
                isFind = true
                // 开始移动i
                while (i < j) {
                    let leftKey = (s as NSString).substring(with: NSMakeRange(i, 1))
                    if countMap[leftKey] == nil {
                        i += 1
                    } else {
                        // i取到了，则是目标值，记录目标值，且变更字典
                        if j - i < target.last! - target.first! {
                            target = [i,j]
                        }
                        i += 1
                        countMap[leftKey]! += 1
                        if countMap[leftKey]! > 0 {
                            //新值大于0.跳出，进行右指针的移动
                            break
                        }
                    }
                }
            }
            j += 1
        }
        
        if isFind {
            let range:NSRange = NSMakeRange(target.first!, target.last! - target.first! + 1)
            return (s as NSString).substring(with: range)
        }
        return ""
    }
    
    func isAllValueIsZero(_ map: [String:Int]) -> Bool {
        for item in map.values {
            if item > 0 {
                return false
            }
        }
        return true
    }
    
    func errorFunc(_ s: String, _ t: String) -> String {
        // 子串：代表是连续的字符（谨记）
        // 通用功能，判断是否 已包含t。根据t简历一个字典，每次遇到目标值就移除一个key，成功后代表找到该子串
        // n * log(n)： 目标为最小子串，可以认为子串一定是，从s的某个字符的位置开始的，那么只需要从s每个字符作为起点，遍历找到所有的子串，然后取最小值
        if s.count < t.count {
            return ""
        }
        var countMap: [Character:Int] = [:]
        for c in t {
            countMap[c] = countMap[c, default: 0] + 1
        }
    
        var targetIndexs: [[Int]] = []
        let max = s.count - t.count
        for i in 0...max {
            // 寻找初始位置
            let c = s[s.index(s.startIndex,offsetBy: i)]
            if countMap[c] == nil {
                continue
            }
            
            var currentMap = countMap
            for j in i..<s.count {
                let c = s[s.index(s.startIndex,offsetBy: j)]
                let target = currentMap[c]
                if target == nil {
                    continue
                }
                if target! - 1 > 0 {
                    currentMap[c] = target! - 1
                    continue
                }
                // 字典更新完毕后,查看是否已经满足要求了
                currentMap.removeValue(forKey: c)
                
                if currentMap.keys.count == 0 {
                    // 找到目标indexs
                    if i == j {
                        return String(c)// 单个目标
                    } else {
                        targetIndexs.append([i,j])
                    }
                }
            }
        }
        // 遍历targetIndexs，找到最小的
        if targetIndexs.count > 0 {
            var minIndexs: [Int] = targetIndexs.first!
            for indexs in targetIndexs {
                if indexs.last! - indexs.first! < minIndexs.last! - minIndexs.first! {
                    minIndexs = indexs
                }
            }
            let range:NSRange = NSMakeRange(minIndexs.first!, minIndexs.last! - minIndexs.first! + 1)
            return (s as NSString).substring(with: range)
        }
        
        
        return ""
    }
}
