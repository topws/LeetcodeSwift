//
//  IsValidKuohao.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/25.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class IsValidKuohao {
    
    func isValid(_ s: String) -> Bool {

        if s.count % 2 == 1 {
            return false
        }
        let dict = [")":"(","]":"[","}":"{"]
        let leftDict = ["(":true,"[":true,"{":true]
        var remain:[String] = []
        // 遇到左边的加入，遇到右边的移除
        for c in s {
            if leftDict[String(c)] == true {
                // isLeft
                remain.append(String(c))
            } else {
                // isRight
                let target = dict[String(c)]
                if remain.last == target {
                    remain.removeLast()
                } else {
                    return false
                }
            }
        }
        
        return remain.count == 0
    }
}
