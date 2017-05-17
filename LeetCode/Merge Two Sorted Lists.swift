//
//  Merge Two Sorted Lists.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/17.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation




/*
 合并两个排好序的数组 并且结果也排序
 
 用递归 计算出结果
 
 */
class MergeTwoSortedLists {
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
