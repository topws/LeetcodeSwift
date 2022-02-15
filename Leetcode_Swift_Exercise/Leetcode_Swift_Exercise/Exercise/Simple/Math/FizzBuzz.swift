//
//  FizzBuzz.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/12/13.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

class FizzBuzz {
    func fizzBuzz(_ n: Int) -> [String] {

        var res:[String] = []
        for item in 1...n {
            let fizz = item % 3
            let buzz = item % 5
            
            if fizz != 0 && buzz != 0 {
                res.append(String(item))
            } else if (fizz == 0 && buzz == 0) {
                res.append("FizzBuzz")
            } else if (fizz == 0) {
                res.append("Fizz")
            } else {
                res.append("Buzz")
            }
        }
        return res
    }
}
