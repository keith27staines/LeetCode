//
//  TwoSum.swift
//  
//
//  Created by Keith Staines on 26/01/2024.
//

import XCTest

// https://leetcode.com/problems/two-sum/description/

final class TwoSum: XCTestCase {

    func testExample1() {
        let target: Int = 9
        let values = [2,7,11,15]
        let indices = twoSum(target: target, nums: values)
        XCTAssertEqual(Set(indices), Set([0,1]))
    }
    
    func testExample2() {
        let target: Int = 6
        let values = [3,2,4]
        let indices = twoSum(target: target, nums: values)
        XCTAssertEqual(Set(indices), Set([1,2]))
    }
    
    func testExample3() {
        let target: Int = 6
        let values = [3,3]
        let indices = twoSum(target: target, nums: values)
        XCTAssertEqual(Set(indices), Set([0,1]))
    }
    
}

fileprivate func twoSum(target: Int, nums: [Int]) -> [Int] {
    for i in 0..<nums.count/2 + 1 {
        for j in (i + 1)..<nums.count {
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }
    return []
}
