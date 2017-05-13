//
//  Median of Two Sorted Arrays.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

class MedianofTwoSortedArrays {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var (A, B) = (nums1, nums2)
        var (m, n) = (A.count, B.count)
        if m > n { // 确保 m < n
            (A, B, m, n) = (B, A, n, m)
        }
        if n == 0 {
            fatalError()
        }
        var (imin, imax, half_len) = (0, m, (m + n + 1) / 2)
        var result = 0.0
        while imin <= imax {
            let i = (imin + imax) / 2
            let j = half_len - i
            if i < m && B[j - 1] > A[i] {
                imin = i + 1
            } else if i > 0 && A[i - 1] > B[j] {
                imax = i - 1
            } else {
                var max_of_left = 0
                var min_of_right = 0
                if i == 0 {
                    max_of_left = B[j - 1]
                } else if j == 0 {
                    max_of_left = A[i - 1]
                } else {
                    max_of_left = max(A[i - 1], B[j - 1])
                }
                if (m + n) % 2 == 1 {
                    result = Double(max_of_left)
                    break
                }
                if i == m {
                    min_of_right = B[j]
                } else if j == n {
                    min_of_right = A[i]
                } else {
                    min_of_right = min(A[i], B[j])
                }
                result = Double(max_of_left + min_of_right) / 2
                break
            }
        }
        return result
    }
    
}
