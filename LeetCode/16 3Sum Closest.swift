//
//  3Sum Closest.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

class Sum3Closest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        guard count > 2 else { return nums.reduce(0, +) }
        var newNums = nums.sorted()
        var result = 99999
        for idx in 0..<count - 2 {
            let idxnum = newNums[idx]
            guard idx == 0 || idx > 0 && idxnum != newNums[idx - 1] else { continue }
            let sum = target - idxnum
            var low = idx + 1
            var hig = count - 1
            while low < hig {
                let lownum = newNums[low]
                let hignum = newNums[hig]
                if lownum + hignum == sum {
                    return target
                } else if lownum + hignum < sum {
                    if abs(lownum + hignum + idxnum - target) < abs(target - result) {
                        result = (lownum + hignum + idxnum)
                    }
                    while low < hig && newNums[low] == newNums[low + 1] {
                        low += 1
                    }
                    low += 1
                } else {
                    if abs(lownum + hignum + idxnum - target) < abs(target - result) {
                        result = (lownum + hignum + idxnum)
                    }
                    while low < hig && newNums[hig] == newNums[hig - 1] {
                        hig -= 1
                    }
                    hig -= 1
                }
            }
        }
        return result
    }
    
}


