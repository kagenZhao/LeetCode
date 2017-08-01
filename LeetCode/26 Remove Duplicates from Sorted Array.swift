//
//  Remove Duplicates from Sorted Array.swift
//  LeetCode
//
//  Created by Kagen Zhao on 2017/5/25.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 
 要求 内存用量为常数

 
 */

class RemoveDuplicatesFromSortedArray {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        // 已经排好序的
        var i = 0
        var j = 1
        while i < j, j < nums.count {
            if nums[i] != nums[j] {
                nums[i + 1] = nums[j]
                i += 1
            }
            j += 1
        }
        return i + 1
    }
}
