//
//  RemoveElement.swift
//  
//
//  Created by Keith Staines on 06/02/2024.
//

import XCTest

final class RemoveElement: XCTestCase {

    func test() {
        var val: Int
        var nums: [Int]
        
        val = 1
        nums = [2,val]
        XCTAssertEqual(removeElement(&nums, val), 1)
        XCTAssertEqual(nums, [2])
        
        nums = [3,2,2,3]
        val = 3
        XCTAssertEqual(removeElement(&nums, val), 2)
        XCTAssertEqual(nums, [2,2])
    }
}

fileprivate func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.compactMap { v in
        v == val ? nil : v
    }
    return nums.count
}
