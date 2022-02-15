//
//  Leetcode_Swift_ExerciseTests.swift
//  Leetcode_Swift_ExerciseTests
//
//  Created by qianwei on 2022/1/20.
//  Copyright © 2022 QW. All rights reserved.
//

import XCTest
@testable import Leetcode_Swift_Exercise

class Leetcode_Swift_ExerciseTests: XCTestCase {

    var sort: QuickSort?
    var randomArr: [Int] = []
    var bubbleSort: BubbleSort?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sort = QuickSort()
        bubbleSort = BubbleSort()
        for i in 0...20000 {
            randomArr.append(Int.random(in: 0...50000))
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let example = DaySeven()
        let bbleft = TreeNode.init(3)
        let bbright = TreeNode.init(4)
        let bbbleft = TreeNode.init(4)
        let bbbright = TreeNode.init(3)
        let bleft = TreeNode.init(2, bbleft, bbright)
        let bright = TreeNode.init(2, bbbleft, bbbright)
        let root: TreeNode = TreeNode.init(1, bleft, bright)
        let res: Bool = example.isSymmetric(root) //example.isSymmetricArray(["3","3","4","3"])
        XCTAssert(res)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            let test = DayTwenty()//[[1,2],[1,1]]
            
            let res = test.verifyPostorder([1,2,5,10,6,9,4,3])
        }
    }

}
