//
//  Remove Element .swift
//  LeetCode
//
//  Created by Kagen Zhao on 2017/6/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation



/*
 Given an array and a value, remove all instances of that value in place and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 
 Example:
 Given input array nums = [3,2,2,3], val = 3
 
 Your function should return length = 2, with the first two elements of nums being 2.
 
 */


class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        // 首先这不是排好序的
        var i = 0
        var j = 0
        while i < nums.count, j < nums.count {
            while j < nums.count - 1, nums[j] == val {
                j += 1
            }
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
            j += 1
        }
        return i
    }
}
