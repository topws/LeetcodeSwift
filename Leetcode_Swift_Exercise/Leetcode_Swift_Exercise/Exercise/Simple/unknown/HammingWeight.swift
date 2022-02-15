//
//  HammingWeight.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/16.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
/*
 位1的个数
 编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为汉明重量）。

  

 提示：

 请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
 在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 3 中，输入表示有符号整数 -3。
 
 输入：00000000000000000000000000001011
 输出：3
 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。

 输入：00000000000000000000000010000000
 输出：1
 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
 */
class HammingWeight {
    private init() {
        
    }
    static let managerInstance = HammingWeight()
    func reverseBits(_ n: Int) -> Int {
            
//        uint32_t rev = 0;
//                for (int i = 0; i < 32 && n > 0; ++i) {
//                    rev |= (n & 1) << (31 - i);
//                    n >>= 1;
//                }
//                return rev;

        var res = 0
        var paras = n
        for i in 0...31 {
            if paras == 0 {
                break
            }
            res |= (paras & 1) << (31 - i)
            paras >>= 1
        }
        return res
    }
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var res = x ^ y
        let two = String(res,radix: 2)
        
        var result = 0
        for c in two {
            if c == "1" {
                result += 1
            }
        }
        
        return result
    }
    func hammingWeight(_ n: Int) -> Int {
        // convert to twoType
        var count = 0
        var remain = n
        var arr: [Int] = []
        while remain >= 2 {
            let yushu = remain % 2
            arr.insert(yushu, at: 0)
            if yushu == 1 {
                count += 1
            }
            remain = remain / 2
        }
        arr.insert(remain, at: 0)
        if remain == 1 {
            count += 1
        }
        print("\(arr)")
        return count
    }
}
