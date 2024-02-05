//
//  MergeSortedArray.swift
//  
//
//  Created by Keith Staines on 05/02/2024.
//

import XCTest

final class MergeSortedArray: XCTestCase {

    func testMerge() {
        var a = [Int]()
        var b = [Int]()
        
        // [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
        a = [1,2,3,0,0,0]
        b = [2,5,6]
        merge(&a, 3, b, 3)
        XCTAssertEqual(a, [1,2,2,3,5,6])
        
        // nums1 = [1], m = 1, nums2 = [], n = 0
        a = [1]
        b = []
        merge(&a, 1, b, 0)
        XCTAssertEqual(a, [1])
        
        // Input: nums1 = [0], m = 0, nums2 = [1], n = 1
        a = [0]
        b = [1]
        merge(&a, 0, b, 1)
        XCTAssertEqual(a, [1])
    }

}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
    let c = nums1
    var i = 0
    var j = 0
    
    for k in 0..<m+n {
        if j < n {
            if c[i] <= nums2[j] && i < m {
                nums1[k] = c[i]
                i += 1
            } else {
                nums1[k] = nums2[j]
                j += 1
            }
        } else {
            nums1[k] = c[i]
            i += 1
        }
    }
}
