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
        let count = nums.count
        let idx = count / 2
        if nums[idx] > target {
            return searchRange(Array(nums[0..<idx]), target)
        } else if nums[idx] < target {
            return searchRange(Array(nums[idx..<nums.endIndex]), target).map({ $0 == -1 ? -1 : $0 + idx })
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
    
//    func _searchRange(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> [Int] {
//
//
//    }
}
