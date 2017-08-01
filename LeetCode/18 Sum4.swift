//
//  Sum4.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note: The solution set must not contain duplicate quadruplets.
 
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 
 */


class Sum4 {
        func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var newNums = nums.sorted()
        let count = nums.count
        guard count > 3 else { return [] }
        var result = [[Int]]()
        for idx1 in 0..<newNums.count - 3 {
            guard newNums[idx1] <= target else { return result }
            guard idx1 == 0 || idx1 > 0 && newNums[idx1] != newNums[idx1 - 1] else { continue }
            for idx in idx1 + 1..<count - 2 {
                let idxnum = newNums[idx]
                guard idxnum <= target - newNums[idx1] else { break }
                guard idx == idx1 + 1 || idx > 0 && idxnum != newNums[idx - 1] else { continue }
                let sum = target - newNums[idx1] - idxnum
                var low = idx + 1
                var hig = count - 1
                while low < hig {
                    let lownum = newNums[low]
                    let hignum = newNums[hig]
                    if lownum + hignum == sum {
                        result.append([newNums[idx1], idxnum, lownum, hignum])
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
        }
        return result
    }

}
