//
//  Reverse Nodes in k-Group.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/22.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 For example,
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 
 */
//
//extension ListNode {
//    public var count: Int {
//        return 1 + (next?.count ?? 0)
//    }
//}

class ReverseNodesInkGroup {
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 1 else { return head }
        let p = head
        var ps = [ListNode]()
        var next: ListNode?
        var tp = p
        while tp?.next != nil {
            ps.append(tp!.next!)
            if ps.count == k - 1 {
                next = tp?.next?.next
                break
            }
            tp = tp?.next
        }
        guard ps.count >= k - 1 else { return head }
        for (l, n) in zip(ps.reversed(), ps.reversed().dropFirst()) {
            l.next = n
        }
        ps.first?.next = p
        p?.next = reverseKGroup(next, k)
        return ps.last
    }
}


