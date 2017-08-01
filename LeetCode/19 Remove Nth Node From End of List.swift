//
//  Remove Nth Node From End of List.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 给定一个链表，从列表的末尾删除第n个节点并返回其头。
 
 例如，
 
 给定链表：1-> 2-> 3-> 4-> 5，n = 2。
 
 从结尾移除第二个节点后，链表变为1-> 2-> 3-> 5。
 注意：
 给定n将始终有效。
 尝试在一次通过这样做。
 */



class RemoveNthNodeFromEndOfList {
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
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard var head = head else { return nil }
        
        var count = 1
        var arr = [UnsafeMutablePointer<ListNode>.init(&head)]
        var next = arr.first!
        while next.pointee.next != nil {
            arr.append(&next.pointee.next!)
            next = arr.last!
            count += 1
        }
        guard count >= n else { return nil }
        if n == 1 {
            if count == 1 {
                return nil
            }
            arr[count - 2].pointee.next = nil
        } else if n == count {
            if count == 1 {
                return nil
            }
            return arr[1].pointee
        } else {
            arr[count - n - 1].pointee.next = arr[count - n + 1].pointee
        }
        return head
    }
}
