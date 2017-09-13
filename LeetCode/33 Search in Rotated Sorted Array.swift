//
//  33 Search in Rotated Sorted Array.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/9/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.

 
 已知一个升序数组在某个未知节点进行旋转后的数组(例如:  0 1 2 4 5 6 7 -> 4 5 6 7 0 1 2 )
 给定一个目标值 求其在数组中的索引
 

 */

class Search_in_Rotated_Sorted_Array: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        guard nums.count > 1 else { return nums[0] == target ? 0 : -1 }
        
        // 首先是旋转之前是升序数组, 那么 第一位 肯定比最后一位大
        // nums.first > nums.last
        // 剩下很简单 分成两边 循环判断就行
        
        if target >= nums[0] {
            var i = 0
            while i < nums.count - 1 {
                if i < nums.count - 1 && nums[i] > nums[i + 1] {
                    break
                }
                if nums[i] >= target {
                    break
                } else {
                    i += 1
                }
            }
            return nums[i] == target ? i : -1
        } else {
            var j = nums.count - 1
            while j > 0 {
                if j > 0 && nums[j] < nums[j - 1] {
                    break
                }
                if nums[j] <= target {
                    break
                } else {
                    j -= 1
                }
            }
            return nums[j] == target ? j : -1
        }
    }
}
