//
//  31 Next Permutation.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/8/1.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place, do not allocate extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 
 
 
 题意:  实现下一个排列, 在原有内存中
 例如
 123 在数学中所有的排列组合 如下
 1 2 3
 1 3 2
 2 1 3
 2 3 1
 3 1 2
 3 2 1
 
 求下一个排列的意思就是 在所有的排列组合中 找到下一个当前数组大的
 比如 123最小 , 下一个排列就是在其他排列组合中找到最小的  就是 132, 以此类推
 
 解题:
 肯定是从后往前找 找到第一个 可不同的 且是比他后边的某一个数字小的
 
 然后把他与他后边的 比他大 但在后边是最小的 交换
 接着再把后边的 从小到大排列
 
 
 */


// 6 9 4 8 7 5 1

// 6 9 4 8 7 5 5 -> 6 9 5 8 7 4 -> 6 9 5 4 7 8

class Next_Permutation: NSObject {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2, j = i + 1
        while i >= 0 {
            if nums[i] >= nums[i + 1] {
                i -= 1
                if i < 0 {
                    nums.sort()
                }
                continue
            }
            while nums[j] <= nums[i] {
                j -= 1
            }
            (nums[i], nums[j]) = (nums[j], nums[i])
            var start = i + 1, end = nums.count - 1
            while start < end {
                (nums[start], nums[end]) = (nums[end], nums[start])
                start += 1
                end -= 1
            }
            
            break
        }
    }
}
