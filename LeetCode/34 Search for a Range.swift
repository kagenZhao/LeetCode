//
//  34 Search for a Range.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/9/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 For example,
 Given [5, 7, 7, 8, 8, 10] and target value 8,
 return [3, 4].
 */

class Search_for_a_Range: NSObject {
    /// 因为 Array() 方法耗时 所以时间稍微长了一点, 优化方法是不用Array()
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [-1, -1] }
        guard nums.count > 1 else { return nums[0] == target ? [0, 0] : [-1, -1] }
        return _searchRange(nums, target, 0, nums.count - 1)
    }
    
    func _searchRange(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> [Int] {
        guard end - start >= 0 else {
            fatalError("end mast be greater or equal to start")
        }
        guard end - start > 0 else { return nums[start] == target ? [start, start] : [-1, -1] }
        guard end - start > 1 else { return nums[start] == target ? (nums[end] == target ? [start, end] : [start, start]) : (nums[end] == target ? [end, end] : [-1, -1]) }
        // eg. start = 5, end = 10, idx = 7
        let idx = start + (end - start) / 2
        if nums[idx] > target {
            return _searchRange(nums, target, start, idx)
        } else if nums[idx] < target {
            return _searchRange(nums, target, idx, end)
        } else {
            var i = idx
            var j = idx
            while i >= 0 {
                if nums[i] == target {
                    i -= 1
                } else {
                    break
                }
            }
            while j < nums.endIndex {
                if nums[j] == target {
                    j += 1
                } else {
                    break
                }
            }
            return [i + 1, j - 1]
        }
    }
}
