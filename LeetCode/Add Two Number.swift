//
//  Add Two Number.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation



/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var l1 = l1
        var l2 = l2
        var result: ListNode?
        var temp: ListNode?
        var next: Int = 0
        
        while l1 != nil || l2 != nil {
            let s1 = (l1?.val ?? 0) + (l2?.val ?? 0) + next
            let s2 = s1 % 10
            let s3 = s1 / 10
            let t = ListNode(s2)
            next = s3
            l1 = l1?.next
            l2 = l2?.next
            if result == nil {
                result = t
            } else {
                temp?.next = t
            }
            temp = t
        }
        
        if next != 0 {
            temp?.next = ListNode(next)
        }
        return result
    }
}
