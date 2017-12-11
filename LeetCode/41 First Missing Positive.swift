//
//  41 First Missing Positive.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/12/11.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 Given an unsorted integer array, find the first missing positive integer.
 
 For example,
 Given [1,2,0] return 3,
 and [3,4,-1,1] return 2.
 
 Your algorithm should run in O(n) time and uses constant space.
 
 根据别人的解题思路 很精妙
 先把对应的 位置调整一下,
 便利一遍, 看到 第i位是n  就把n放到 第n-1位上
 比如  [4, 2, 3, 1, -10] ->  [1, 2, 3, 4, -10]
 然后便利 只要某一位i上的数字n != i + 1  则 return i + 1
 否则 返回 数组个数 + 1
 
 用时 O(2n) ~= O(n)
 空间 S(1) 因为没有改变
 
 */

class First_Missing_Positive: NSObject {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        let count = nums.count
        for i in 0..<count {
            while nums[i] > 0 && nums[i] < count && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        
        for i in 0..<count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        
        return count + 1
    }
}
