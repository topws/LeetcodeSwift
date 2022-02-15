//
//  RomanToInt.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/15.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class RomanToInt {
    /*
     罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

     字符          数值
     I             1
     V             5
     X             10
     L             50
     C             100
     D             500
     M             1000
     例如， 罗马数字 2 写做 II ，即为两个并列的 1 。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

     通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

     I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
     X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
     C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
     给定一个罗马数字，将其转换成整数。
     */
    func romanToInt(_ s: String) -> Int {

        // 默认都是从大到小
        // 只有4，9几个少的场景
        // <3999
        let dict: [String:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000,"IV":4,"IX":9,"XL":40,"XC":90,"CD":400,"CM":900]
        //"LVIII"
        var arr:[String] = []
        for c in s {
            arr.append(String(c))
        }
        
        // 从右到左 进行遍历相加,每次暂存前一位的值
        var res = 0
        var previous: String?
        for str in arr.reversed() {
            if previous == nil {
                // 直接存入
                previous = str
            } else {
                // 判断两位能否连起来
                let target = str + previous!
                if dict[target] == nil {
                    // 连不起来，分开处理
                    res += dict[previous!]!
                    previous = str
                } else {
                    // 两个一起处理
                    res += dict[target]!
                    previous = nil
                }
            }
        }
        
        if previous != nil {
            res += dict[previous!]!
        }
        return res
    }
}
