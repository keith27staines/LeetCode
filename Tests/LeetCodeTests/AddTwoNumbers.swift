//
//  LinkedList.swift
//  
//
//  Created by Keith Staines on 27/01/2024.
//

import XCTest

/*
 https://leetcode.com/problems/add-two-numbers/description/
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

/* This problem is essentially an implementation of the hand arithmetic algorithm
  9 9 9 9
      9 9
 --------
1 0 0 9 8

  945
   65
 ----
 1010
*/

final class AddTwoNumbersTests: XCTestCase {
    
    func testArrayConversion() {
        let array = [1,2,3]
        let list = ListNode(array)
        XCTAssertEqual(array, list.array)
    }
    
    func testExample1() {
        let l1 = ListNode([2,4,3])
        let l2 = ListNode([5,6,4])
        XCTAssertEqual(   [7,0,8], addTwoNumbers(l1, l2)?.array)
    }
    
    func testExample2() {
        let l1 = ListNode([9,9,9,9,9,9,9])
        let l2 =       ListNode([9,9,9,9])
        XCTAssertEqual( [8,9,9,9,0,0,0,1], addTwoNumbers(l1, l2)?.array)
    }
    
    func testExample3() {
        let l1 = ListNode([0])
        let l2 = ListNode([0])
        XCTAssertEqual([0], addTwoNumbers(l1, l2)?.array)
    }
    
    func testExample4() {
        let l1 = ListNode([5,4,9])
        let l2 = ListNode([5,6])
        XCTAssertEqual([0,1,0,1], addTwoNumbers(l1, l2)?.array)
    }
    
    func testExample5() {
        let l1 = ListNode([5])
        let l2 = ListNode([5])
        XCTAssertEqual([0,1], addTwoNumbers(l1, l2)?.array)
    }
}

fileprivate func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let partialSum = ListNode(0, nil)
    let l1Count = l1?.array.count ?? 0
    let l2Count = l2?.array.count ?? 0
    let maxCount = max(l1Count, l2Count)
    let l1Pad = maxCount - l1Count
    let l2Pad = maxCount - l2Count
    
    let l1Padded = l1?.pad(l1Pad)
    let l2Padded = l2?.pad(l2Pad)

    return addNodes(l1Padded, l2Padded, partialSum: partialSum, carry: 0).next
    
    func addNodes(
        _ l1: ListNode?,
        _ l2: ListNode?,
        partialSum: ListNode,
        carry: Int) -> ListNode {
        guard l1 != nil && l2 != nil else { return partialSum }
        
        if l1 == nil {
            partialSum.next = l2
            return partialSum
        }
        if l2 == nil {
            partialSum.next = l1
            return partialSum
        }
        
        let sum = l1!.val + l2!.val + carry

        if sum < 10 {
            partialSum.last?.next = ListNode(sum, nil)
            return addNodes(l1?.next, l2?.next, partialSum: partialSum, carry: 0)
        } else {
            partialSum.last?.next = ListNode(sum - 10, nil)
            if l1?.next != nil || l2?.next != nil {
                return addNodes(l1?.next, l2?.next, partialSum: partialSum, carry: 1)
            } else {
                partialSum.last?.next = ListNode(1, nil)
                return partialSum
            }
        }
    }
}
    
extension ListNode {
    
    var last: ListNode? {
        guard let next = next else { return self }
        return next.last
    }

    func pad(_ n: Int) -> ListNode {
        (0..<n).forEach { _ in
            last?.next = ListNode(0, nil)
        }
        return self
    }
    
    var array: [Int] {
        var array = [val]
        guard let next = next else { return array }
        array.append(contentsOf: next.array)
        return array
    }
    
    convenience init(_ array: [Int]) {
        let val = array.first ?? 0
        let next = array.count > 1 ? ListNode(Array(array.dropFirst())) : nil
        self.init(val, next)
    }
}

class ListNode {
    let val: Int
    var next: ListNode?
    
    init(_ val: Int = 0, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}
