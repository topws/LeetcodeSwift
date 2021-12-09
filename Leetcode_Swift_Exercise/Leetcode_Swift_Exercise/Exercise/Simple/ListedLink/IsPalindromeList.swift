//
//  IsPalindromeList.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/30.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation
class IsPalindromeList {
    func isPalindrome(list: ListNode?) -> Bool {
        
        // val: 0 - 9
        var str = ""
        var current = list
        while current != nil {
            str.append(String(current!.val))
            current = current?.next
        }
        return str == String(str.reversed())
    }
}
