//
//  RemoveDuplicates.swift
//  
//
//  Created by Keith Staines on 06/02/2024.
//

import XCTest

// https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150

final class RemoveDuplicates: XCTestCase {
    
    func test() {
        var nums = [1,1,2]
        var k = removeDuplicates2(&nums)
        XCTAssertEqual(nums, [1,2,2])
        XCTAssertEqual(k, 2)
        
    }


}


fileprivate func removeDuplicates(_ nums: inout [Int]) -> Int {
    var k = 0
    for _ in nums {
        if k > 0 && nums[k] == nums[k-1] {
            nums.remove(at: k)
        } else {
            k += 1
        }
    }
    return k
}

fileprivate func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var original = nums
    var k = 0
    for (index, value) in nums.enumerated() {
        if index > 0 && original[index] == original[index-1] {
            
        } else {
            nums[k] = original[index]
            k += 1
        }
    }
    return k
}
