//
//  TimeOffset.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/18.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class TimeOffset {
    //给定一个 24 小时制（小时:分钟 "HH:MM"）的时间列表，找出列表中任意两个时间的最小时间差并以分钟数表示。
//    输入：timePoints = ["00:00","23:59","00:00"]
//    输出：0
    func findMinDifference(_ timePoints: [String]) -> Int {

        // 排序
        if timePoints.count > 1440 {
            return 0
        }
        if timePoints.count <= 1 {
            return -1
        }
        var newB = timePoints
        newB.sort { v1, v2 in
            return convertToValue(v1) < convertToValue(v2)
        }
        // 取相邻
        var pre = convertToValue(newB.first!)
        var minM = Int.max
        for item in newB[1...newB.count-1] {
            let convert = convertToValue(item)
            let offset = abs(convert - pre)
            let cur = offset > 720 ? (1440 - offset) : offset
            minM = min(minM, cur)
            
            pre = convert
        }
        // 末尾
        let first = convertToValue(newB.first!)
        let last = convertToValue(newB.last!)
        let offset = abs(first - last)
        let trueOff = offset > 720 ? (1440 - offset) : offset
        minM = min(minM, trueOff)
        return minM
    }
    
    func convertToValue(_ str: String) -> Int {
        if str.count != 5 {
            return 0
        }
        let array = str.components(separatedBy: ":")
        if array.count != 2 {
            return 0
        }
        return Int(array.first!)! * 60 + Int(array.last!)!
    }
}
