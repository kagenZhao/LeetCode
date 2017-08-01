//
//  Swap Nodes in Pairs.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/19.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 [1, 2, 3, 4] -> [2, 1, 4, 3]
 
 */

class SwapNodesInPairs {
    
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard var head = head else { return nil }
        var next: ListNode? = head
        var flag = true
        var last: ListNode!
        while next?.next != nil {
            let t1 = next
            let t2 = next?.next
            let t3 = next?.next?.next
            t2?.next = t1
            t1?.next = t3
            next = t3
            if flag {
                head = t2!
                flag = false
            }else {
                last.next = t2!
            }
            last = t1!
        }
        return head
    }
}
