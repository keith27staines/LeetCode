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
        merge(a: &a, m: 3, b: b, n: 3)
        XCTAssertEqual(a, [1,2,2,3,5,6])
        
        // nums1 = [1], m = 1, nums2 = [], n = 0
        a = [1]
        b = []
        merge(a: &a, m: 1, b: b, n: 0)
        XCTAssertEqual(a, [1])
        
        // Input: nums1 = [0], m = 0, nums2 = [1], n = 1
        a = [0]
        b = [1]
        merge(a: &a, m: 0, b: b, n: 1)
        XCTAssertEqual(a, [1])
        
        
    }

}

/*
 [1 ,2 ,3, 0, 0, 0]
 [2, 5, 6]
 */

func merge(a: inout [Int], m: Int, b: [Int], n: Int) {
    let c = a
    var i = 0
    var j = 0
    
    for k in 0..<m+n {
        if j < n {
            if c[i] <= b[j] && i < m {
                a[k] = c[i]
                i += 1
            } else {
                a[k] = b[j]
                j += 1
            }
        } else {
            a[k] = c[i]
            i += 1
        }
    }
}
