//
//  33 Search in Rotated Sorted Array.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/8/14.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 已知一个升序数组, 在某个未知的点进行旋转,
 给定旋转之后的数组, 在其中找到某个target
 
 
 */

class Search_in_Rotated_Sorted_Array: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        var (l, r) = (0, nums.count - 1)
        while l < r {
            let m = (l + r) / 2
            if nums[m] < target {
                if nums[l] > nums[m] && nums[l] <= target {
                    r = m
                } else {
                    l = m + 1
                }
            } else if nums[m] > target {
                if nums[r] < nums[m] && target <= nums[r] {
                    l = m + 1
                } else {
                    r = m
                }
            } else {
                return m
            }
        }
        return nums[l] == target ? l : -1
    }
}
