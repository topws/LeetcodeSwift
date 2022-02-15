//
//  DayNineteen.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2022/2/13.
//  Copyright © 2022 QW. All rights reserved.
//

import Foundation

class DayNineteen {}

extension DayNineteen {
    //求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
    
    func sumNums(_ n: Int) -> Int {
        // 使用 与
        return (1...n).reduce(0) { partialResult, item in
            return partialResult + item
        }
    }

}
