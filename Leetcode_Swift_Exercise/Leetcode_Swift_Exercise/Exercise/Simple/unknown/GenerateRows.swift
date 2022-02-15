//
//  GenerateRows.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/20.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class GenerateRows {
    
    func generate(_ numRows: Int) -> [[Int]] {
        
        var res: [[Int]] = []
        for i in 1...numRows {
            let last = res.last
            if last == nil {
                res.append([1])
            } else {
                // f(n) = s(n)+ s(n-1)
                var newL: [Int] = []
                for j in 0...i-1 {
                    if j == 0 {
                        newL.append(1)
                    } else if j == last!.count {
                        newL.append(1)
                    } else {
                        newL.append(last![j]+last![j-1])
                    }
                }
                res.append(newL)
            }
        }
        
        return res
    }
}
