//
//  42 接雨水.swift
//  LeetCode
//
//  Created by 赵国庆 on 2018/10/10.
//  Copyright © 2018 kagenZhao. All rights reserved.
//

/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 
 示例图片
 https://leetcode-cn.com/static/images/problemset/rainwatertrap.png
 
 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。
 
 示例:
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 */

import Foundation

class 接雨水 {
    // 网站解答的答案 是从两边倒中间的计算
    func trap(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        var result = 0
        var lidx = 0
        var ridx = height.count - 1
        var lmax = 0
        var rmax = 0
        while ridx > lidx {
            let left = height[lidx]
            let right = height[ridx]
            if left < right {
                if left > lmax {
                    lmax = left
                } else {
                    result += lmax - left
                }
                lidx += 1
            } else {
                if right > rmax {
                    rmax = right
                } else {
                    result += rmax - right
                }
                ridx -= 1
            }
        }
        return result
    }
    
    // 我自己的解答 是从到右的计算
    func trap0(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        var rightIdx = 1
        var result = trap2(height, leftIdx: 0, rightIdx: &rightIdx)
        while rightIdx < height.count - 1 {
            result += trap2(height, leftIdx: rightIdx, rightIdx: &rightIdx)
        }
        return result
    }
    
    func trap2(_ height: [Int], leftIdx: Int, rightIdx: inout Int) -> Int {
        guard height.count > leftIdx + 1 else { return 0 }
        var result = 0
        var lidx = leftIdx
        var ridx = leftIdx + 1
        let left = height[leftIdx]
        var moveleft = height[lidx]
        var right = height[ridx]
        var des = 0
        var moveCount = 0
        while ridx <= height.count - 1 {
            right = height[ridx]
            if right < left {
                des = left - right
                if height[ridx] != height[lidx] {
                    let oldlidx = lidx
                    lidx = ridx
                    if height[lidx] >= moveleft {
                        moveCount += ridx - oldlidx
                    }
                    moveleft = height[lidx]
                }
                result += trap2(height, leftIdx: ridx, rightIdx: &ridx)
                if height[ridx] > moveleft && height[ridx] < left {
                    result += (height[ridx] - moveleft) * (ridx - lidx + moveCount)
                }
                if ridx == height.count - 1 {
                    right = height[ridx]
                    rightIdx = ridx
                    if right >= left {
                        rightIdx = ridx
                        result += des * max((ridx - leftIdx - 1), 0)
                    }
                    break
                }
            } else { // right >= left
                rightIdx = ridx
                result += des * max((ridx - leftIdx - 1), 0)
                break
            }
        }
        rightIdx = min(ridx, height.count - 1)
        return result
    }
}
