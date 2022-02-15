//
//  DayFive.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/19.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayFive {
    
}

//二维数组中的查找
//在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个高效的函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
//0 <= n <= 1000
//0 <= m <= 1000
extension DayFive {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 { return false}
        if matrix.first!.count == 0 {return false}
        if matrix.count == 1 {//一行
            return matrix.first!.contains(target)
        }
        if matrix.first!.count == 1 {//一列
            for item in matrix {
                if item.first! == target {
                    return true
                }
            }
            return false
        }
        let minV = matrix.first!.first!
        let maxV = matrix.last!.last!
        if minV > target || maxV < target {
            return false
        }
        // 在矩阵内，二分
        let rowIndex = (matrix.count - 1) / 2
        let columIndex = (matrix.first!.count - 1) / 2
        let center = matrix[rowIndex][columIndex]
        if center == target {
            return true
        }
        if center < target {
            // 中心小于target，把左上角的矩阵移除
            let bottomArr = Array(matrix[rowIndex+1...matrix.count-1])
            var newArr:[[Int]] = []
            for arr in matrix[0...rowIndex] {
                newArr.append(Array(arr[columIndex+1...arr.count-1]))
            }
            return findNumberIn2DArray(bottomArr, target) || findNumberIn2DArray(newArr, target)
        }
        // 中心大于target，把右下角的矩阵移除
        let topArr = Array(matrix[0...rowIndex])
        var newArr:[[Int]] = []
        if columIndex - 1 >= 0 {
            for arr in matrix[rowIndex+1...matrix.count-1] {
                newArr.append(Array(arr[0...columIndex-1]))
            }
        }
        return findNumberIn2DArray(topArr, target) || findNumberIn2DArray(newArr, target)
    }
    
    // 线性查找
//    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
//        guard matrix.count > 0, matrix[0].count > 0 else {
//            return false
//        }
//
//        let m = matrix.count, n = matrix[0].count
//
//        var i = m - 1, j = 0
//
//        while i >= 0 && j < n {
//            if matrix[i][j] == target {
//                return true
//            }
//            if matrix[i][j] > target {
//                i -= 1
//            } else {
//                j += 1
//            }
//        }
//        return false
//    }
    
    
}


extension DayFive {
    //旋转数组的最小数字
    
    // 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
    // 给你一个可能存在 重复 元素值的数组 numbers ，它原来是一个升序排列的数组，并按上述情形进行了一次旋转。请返回旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一次旋转，该数组的最小值为1。

    func minArray(_ numbers: [Int]) -> Int {
        
        var low = 0
        var high = numbers.count - 1
        while (low < high) {
            let middle = low + (high - low) / 2
            if numbers[middle] < numbers[high] {
                // 中间值比最右边小，最小值在左边
                high = middle
            } else if numbers[middle] > numbers[high] {
                // 中间值比最右边大，最小值在右边
                low = middle+1
            } else {
                // 相等时，不能确定左右，只能去掉最右边的一个点
                high = high - 1
            }
        }
        return numbers[low]
    }
}

extension DayFive {
    //第一个只出现一次的字符
    
    //在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。
    
    //输入：s = "abaccdeff"
    //输出：'b'
    
    //输入：s = ""
    //输出：' '
    func firstUniqChar(_ s: String) -> Character {
        
        var map: [Character:Bool] = [:]
        var mapForIndex: [Character:Int] = [:]
        
        for (index,c) in s.enumerated() {
            if map[c] != nil {
                // 已存在
                mapForIndex[c] = nil
            } else {
                map[c] = true
                mapForIndex[c] = index
            }
        }
        var minIndex = Int.max
        var c: Character?
        for key in mapForIndex.keys {
            if mapForIndex[key]! < minIndex {
                // 更小
                c = key
                minIndex = mapForIndex[key]!
            }
        }
        
        return c ?? " "
    }
}
