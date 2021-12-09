//
//  StockBuy.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/17.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class StockBuy {
    
    func stockBuy(_ arr:[Int]) -> Int {
    
        if arr.count <= 1 {
            return 0
        }
        // [1,2,3,4,5]
        // 如果是降序 直接舍弃前一个，如果是升序，则保留
        // 一直存储的是两个值，预期的买入价，预期的卖出价
        var buyPrice = arr.first!
        var salePrice = -1
        var result = 0
        for item in arr[1..<arr.count] {
            
            if salePrice == -1 {
                // sale 不存在
                if buyPrice < item {
                    salePrice = item
                } else {
                    buyPrice = item
                }
            } else {
                // sale 存在
                if salePrice <= item {
                    salePrice = item
                } else {
                    // 卖出
                    result += salePrice - buyPrice
                    salePrice = -1
                    buyPrice = item
                }
            }
        }
        // 最后一天要操作下
        if salePrice != -1 {
            result += salePrice - buyPrice
        }
        return result
    }
}
