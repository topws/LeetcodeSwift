//
//  DaySeventeen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/8.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation
class DaySeventeen {}

//  40. 最小的k个数
extension DaySeventeen {
    // 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.count == 0 || k == 0 {
            return []
        }
        // 实现一个优化后的 快拍算法
        // 只需要找出最小个K个数，那么 后面大的数不需要且前面小的数不需要排序
        var newArr: [Int] = arr
        helpLeastNumber(&newArr, k, 0, newArr.count - 1)
        return Array(newArr[0...k-1])
    }
    
    func helpLeastNumber(_ arr: inout[Int], _ k: Int,_ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        // 哨兵
        let pivot = left
        let pivotValue = arr[pivot]
        // 待交换的index
        var waitChangeIndex = pivot + 1
        for index in (left + 1...right) {
            // 如果比哨兵小就交换
            if pivotValue >= arr[index] {
                arr.swapAt(waitChangeIndex, index)
                waitChangeIndex += 1
            }
        }
        // 排序完成后，交换哨兵位置
        arr.swapAt(waitChangeIndex - 1, pivot)
        
        // 如果排序完成后，当前的哨兵位置 == k，则直接返回，否则递推下去
        if waitChangeIndex == k {
            return
        } else if waitChangeIndex < k {
            // 加上哨兵位置的数量 不够K，那么前面的数都符合标准了，往后进行快拍
            helpLeastNumber(&arr, k, waitChangeIndex, right)
        } else {
            // 加上哨兵位置的数量 比K大，那么后面的数都不要了，往前进行快拍
            helpLeastNumber(&arr, k, left, waitChangeIndex - 1 - 1)
        }
    }
}

//41. 数据流中的中位数
//    如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。

//设计一个支持以下两种操作的数据结构：
//
//void addNum(int num) - 从数据流中添加一个整数到数据结构中。
//double findMedian() - 返回目前所有元素的中位数。

class MedianFinder {

    /** initialize your data structure here. */
    init() {

    }
    
    var sortedArr: [Int] = []
    
    func addNum(_ num: Int) {
        sortedArr.append(num)
        sortedArr.sort()
    }
    
    func findMedian() -> Double {
        if sortedArr.count == 0 {
            return 0
        }
        let remain = sortedArr.count % 2
        let mid = sortedArr.count / 2
        if remain == 0 {
            return Double((sortedArr[mid] + sortedArr[mid-1]))*0.5
        } else {
            return Double(sortedArr[mid])
        }
    }
}
