//
//  String+QuickCharacterByIndex.swift
//  Leetcode_Swift_Exercise
//
//  Created by qianwei on 2021/11/23.
//  Copyright © 2021 QW. All rights reserved.
//

import Foundation

extension String {
    func getCharacterByIndex(_ index: Int) -> Character {
        return self[self.index(self.startIndex,offsetBy: index)]
    }
    
    func quickC(_ index: Int) -> Character {
        return self[self.index(self.startIndex,offsetBy: index)]
    }
}
