//
//  main.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val) -> \(next != nil ? next!.description : "")"
    }
}

extension Array where Element == Int {
    var toNode: ListNode? {
        return reversed().reduce(nil) { (r: ListNode?, e: Element) -> ListNode? in
            let n = ListNode(e)
            n.next = r
            return n
        }
    }
}

//print(AddTwoNumbers().addTwoNumbers([2, 4, 3].toNode, [5, 6, 4].toNode) ?? "")


//print(LongestSubStringWithoutRepetingCharacters().lengthOfLongestSubstring("dvdf"))



//ReqularExpressionMatching1().isMatch("abc", "a*bc")

//[
//    [true, false, false, false, false, false],
//    [false, false, false, false, false, false],
//    [false, false, false, false, false, false],
//    [false, false, false, false, false, false]
//]

//[
//    [true, false, true, false, false],
//    [false, true, true, false, false],
//    [false, false, false, true, false],
//    [false, false, false, false, true]
//]

//print(RomanToInteger().romanToInt("DCXXI"))








