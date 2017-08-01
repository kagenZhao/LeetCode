//
//  3Sum.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/15.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 
 
 
 */



class Sum3 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        guard count > 2 else { return [] }
        var newNums = nums.sorted()
        var result = [[Int]]()
        for idx in 0..<count - 2 {
            let idxnum = newNums[idx]
            guard idxnum <= 0 else { return result }
            guard idx == 0 || idx > 0 && idxnum != newNums[idx - 1] else { continue }
            let sum = -idxnum
            var low = idx + 1
            var hig = count - 1
            while low < hig {
                let lownum = newNums[low]
                let hignum = newNums[hig]
                if lownum + hignum == sum {
                    result.append([idxnum, lownum, hignum])
                    while low < hig && newNums[low] == newNums[low + 1] {
                        low += 1
                    }
                    while low < hig && newNums[hig] == newNums[hig - 1] {
                        hig -= 1
                    }
                    low += 1; hig -= 1
                } else if lownum + hignum < sum {
                    low += 1
                } else {
                    hig -= 1
                }
            }
        }
        return result
    }
}
