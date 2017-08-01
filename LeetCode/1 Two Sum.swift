//
//  Two Sum.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */


struct TowSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        var idxs = [Int:Int]()
        for (idx, value) in nums.enumerated() {
            if let j = idxs[target - value] {
                return [j, idx]
            }
            idxs[value] = idx
        }
        return []
    }
}

