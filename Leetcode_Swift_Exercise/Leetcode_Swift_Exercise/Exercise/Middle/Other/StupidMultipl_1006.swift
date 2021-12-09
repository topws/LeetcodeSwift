//
//  StupidMultipl_1006.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/4/1.
//  Copyright © 2021 Avazu Holding. All rights reserved.
//

import UIKit
/*
 通常，正整数 n 的阶乘是所有小于或等于 n 的正整数的乘积。例如，factorial(10) = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1。

 相反，我们设计了一个笨阶乘 clumsy：在整数的递减序列中，我们以一个固定顺序的操作符序列来依次替换原有的乘法操作符：乘法(*)，除法(/)，加法(+)和减法(-)。

 例如，clumsy(10) = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1。然而，这些运算仍然使用通常的算术运算顺序：我们在任何加、减步骤之前执行所有的乘法和除法步骤，并且按从左到右处理乘法和除法步骤。

 另外，我们使用的除法是地板除法（floor division），所以 10 * 9 / 8 等于 11。这保证结果是一个整数。

 实现上面定义的笨函数：给定一个整数 N，它返回 N 的笨阶乘。

 示例 1：

 输入：4
 输出：7
 解释：7 = 4 * 3 / 2 + 1
 示例 2：

 输入：10
 输出：12
 解释：12 = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1
  7,7,8,9


 提示：

 1 <= N <= 10000
 -2^31 <= answer <= 2^31 - 1  （答案保证符合 32 位整数。）
 */

enum HandleType:Int {
    case None = 0
    case Multiply = 1
    case Divide
    case Add
    case Substract
}

class StupidMultipl_1006: NSObject {

    func clumsy(_ N: Int) -> Int {
        if N < 3 {
            return N
        }
        if N == 3 {
            return 7
        }
        var preSymbolIndex = -1
        var sum = 0
        var currentSum = 0
        var isFirst = true
        for i in (1...N).reversed() {
            if preSymbolIndex < 0 {
                currentSum = i
            } else if (preSymbolIndex == 1) {
                currentSum = currentSum * i
                if i == 1 {
                    // last
                    sum -= currentSum
                    break
                }
            } else if (preSymbolIndex == 2) {
                currentSum = currentSum / i
                if i == 1 {
                    // last
                    sum -= currentSum
                    break
                }
                if isFirst {
                    sum = currentSum
                    isFirst = false
                } else {
                    sum -= currentSum
                }
                
            } else if (preSymbolIndex == 3){
                sum += i;
            } else {
                //substract
                currentSum = i
                if i == 1 {
                    // last
                    sum -= currentSum
                    break
                }
            }
            if preSymbolIndex == -1 {
                preSymbolIndex = 1
            } else if preSymbolIndex < 4 {
                preSymbolIndex += 1
            } else {
                preSymbolIndex = 1
            }
        }
        return sum
    }
}
