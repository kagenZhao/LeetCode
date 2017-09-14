//
//  35 Search Insert Position.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/9/14.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa



/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 
 跟上一题一样
 
 */

class Search_Insert_Position: NSObject {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return _searchInsert(nums, target, 0, nums.endIndex - 1)
    }
    
    func _searchInsert(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        guard end - start > 0 else { return nums[start] >= target ? start : start + 1 }
        guard end - start > 1 else { return nums[start] >= target ? start : (nums[end] >= target ? end : end + 1) }
        // eg. start = 5, end = 10, idx = 7
        let idx = start + (end - start) / 2
        if nums[idx] >= target {
            return _searchInsert(nums, target, start, idx)
        } else {
            return _searchInsert(nums, target, idx, end)
        }
    }
}
