//
//  String+Crpto.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2020/6/4.
//  Copyright © 2020 Avazu Holding. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {

    /// Hashing algorithm for hashing a string instance.
    ///
    /// - Parameters:
    ///   - type: The type of hash to use.
    ///   - output: The type of output desired, defaults to .hex.
    /// - Returns: The requested hash output or nil if failure.
    func hashed(_ type: HashType, output: HashOutputType = .hex) -> String? {

        // convert string to utf8 encoded data
        guard let message = data(using: .utf8) else { return nil }
        return message.hashed(type, output: output)
    }
}
