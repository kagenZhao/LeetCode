//
//  Merge k Sorted Lists.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/19.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 
 合并多个 链表 
 
 递归进行两两合并 直到 只剩一个 返回
 
 
 100ms 超过100%
 
 */


class MergeKSortedLists {
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists : [ListNode] = lists.compactMap{$0}
        while lists.count > 1 {
            lists = stride(from: 0, to:lists.count - 1 , by: 2).compactMap({ mergeTwoLists(lists[$0], lists[$0 + 1])! }) + (lists.count % 2 == 1 ? [lists.last!] : [])
        }
        return lists.count > 0 ? lists[0] : nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }

}
