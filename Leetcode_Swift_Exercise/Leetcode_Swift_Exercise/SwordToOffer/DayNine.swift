//
//  DayNine.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/27.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayNine {}

extension DayNine {
    //礼物的最大价值
    //在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？
//    int m = grid.length, n = grid[0].length;
//            for(int i = 0; i < m; i++) {
//                for(int j = 0; j < n; j++) {
//                    if(i == 0 && j == 0) continue;
//                    if(i == 0) grid[i][j] += grid[i][j - 1] ;
//                    else if(j == 0) grid[i][j] += grid[i - 1][j];
//                    else grid[i][j] += Math.max(grid[i][j - 1], grid[i - 1][j]);
//                }
//            }
//            return grid[m - 1][n - 1];
    func maxValue(_ grid: [[Int]]) -> Int {
        var newGrid = grid
        let m = newGrid.count
        let n = newGrid.first!.count
        for i in 0...m-1 {
            for j in 0...n-1 {
                if i == 0 && j == 0 {
                    continue
                } else if i == 0 {
                    newGrid[i][j] += newGrid[i][j-1]
                } else if j == 0 {
                    newGrid[i][j] += newGrid[i-1][j]
                } else {
                    newGrid[i][j] += max(newGrid[i][j - 1], newGrid[i - 1][j])
                }
            }
        }
        return newGrid[m-1][n-1]
    }
    
}

extension DayNine {
//      连续子数组的最大和
//                输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。
//
//    要求时间复杂度为O(n)。
//
//    输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
//    输出: 6
//    解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
//
//    1 <= arr.length <= 10^5
//    -100 <= arr[i] <= 100
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0
        var result = nums.first!
        for item in nums {
            pre = max(pre + item, item)
            result = max(result, pre)
        }
        return result
    }
}
