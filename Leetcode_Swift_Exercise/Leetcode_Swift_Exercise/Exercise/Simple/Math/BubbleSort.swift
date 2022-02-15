//
//  BubbleSort.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/1/5.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class BubbleSort {
    
    func bubbleSort(_ nums: inout[Int]){
        // 冒泡排序，每次比较相邻两个元素，把大的元素放到后面，每次操作完，最后那个位置就是最大的。此外，优化的思路是添加一个flag，如果一次遍历后不需要调整，说明已经是正序了，则直接跳出。
        if nums.count <= 1 {return}
        var temp: Int = 0
        var flag: Bool = false
        for i in 0...nums.count - 2 {
            let right = nums.count - 1 - i
            for j in 0...right-1 {
                if nums[j] > nums[j+1] {
                    temp = nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = temp
                    flag = true
                }
            }
            if flag == false {
                break
            }
        }
    }
}

class QuickSort {
//    从数列中挑出一个元素，称为 "基准"（pivot）;
//
//    重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
//
//    递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序；
    
    func quickSort(_ arr: inout[Int]) {
        quickSortHelper(&arr, 0, arr.count-1)
    }
    func quickSortHelper(_ arr: inout[Int], _ left: Int,_ right: Int) {
        
        if left < right {
            let partitionIndex = partition(&arr, left, right)
            quickSortHelper(&arr, left, partitionIndex-1)
            quickSortHelper(&arr, partitionIndex+1, right)
        }
        
    }
    func partition(_ arr: inout[Int], _ left:Int,_ right:Int) -> Int {
        let pivot = left
        var index = pivot + 1// 换位目标值
        let pivotV = arr[pivot]
        for i in (pivot+1)...right {
            if arr[i] < pivotV {// 取第一个数为哨兵，如果当前的值比哨兵值小，则交互i与index,这里交换后的结果，其实就是让第0个位置后的连续的N个值都是小于哨兵值，这样再遍历结束后，再把连续N个值中的最后一个位置的数和哨兵进行换位，就实现了原地排序
                if i != index {// 加一句优化判断的代码接可以大幅提升性能
                    arr.swapAt(i, index)
                }
                index += 1
            }
        }
        arr.swapAt(pivot, index - 1)
        return index - 1
    }
}
