//
//  CountAndSay.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/25.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class CountAndSay {
    func countAndSay(_ n: Int) -> String {

        if n == 1 {
            return "1"
        }
        var count = n - 1
        var res = "1"
        while true {
            if count == 0 {
                break
            }
            count -= 1
            res = getDescStr(res)
        }
        return res
    }
    
    func getDescStr(_ strN: String) -> String {
        
        var res = ""
        var nextReplaceLength = 1
        
        var previous = ""
        for c in strN {
            let c = String(c)
            if c == previous {
                let ocRes: NSString = res as NSString
                let range = NSMakeRange(res.count - 1 - nextReplaceLength, nextReplaceLength)
                let oldCount = ocRes.substring(with: range)
                let newCount = Int(oldCount)! + 1
                nextReplaceLength = String(newCount).count
                res = ocRes.replacingCharacters(in: range, with:String(newCount)) as String
            } else {
                previous = c
                res.append("1")
                res.append(c)
            }
        }
        return res
        
    }
}
