//
//  1025.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2020/1/21.
//  Copyright © 2020 Avazu Holding. All rights reserved.
//

import Foundation
/*
 爱丽丝和鲍勃一起玩游戏，他们轮流行动。爱丽丝先手开局。

 最初，黑板上有一个数字 N 。在每个玩家的回合，玩家需要执行以下操作：

 选出任一 x，满足 0 < x < N 且 N % x == 0 。
 用 N - x 替换黑板上的数字 N 。
 如果玩家无法执行这些操作，就会输掉游戏。

 只有在爱丽丝在游戏中取得胜利时才返回 True，否则返回 false。假设两个玩家都以最佳状态参与游戏。
 
 1 <= N <= 1000
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/divisor-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class OneZeroTwoFive {

    var avalibleDic: [Int : Bool] = [:]
    func divisorGame(_ N: Int) -> Bool {
        
        // 找出爱丽斯能赢的数字，递归所有情况，能赢就Break，否则就继续遍历，直到结束
        if N == 1 {
            return false
        }
        
        var divisorArr:[Int] = []
        for i in 1..<N {
            if N % i == 0 {
                divisorArr.append(i)
            }
        }
        
        for i in divisorArr {
            if (N - i) == 1 {
                return true
            }
            
            if let temp = avalibleDic[N - i] {
                if !temp {
                    return true
                }
            } else {
                let nAvalible = divisorGame(N - i)
                avalibleDic[N - i] = nAvalible
                if !nAvalible {
                    return true
                }
            }
            
        }
        return false
    }
}
