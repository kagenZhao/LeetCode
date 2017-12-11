//
//  40 Combination Sum II.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/12/8.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa


/*
 Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
 
 Each number in C may only be used once in the combination.
 
 Note:
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8,
 A solution set is:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 
 // 跟上一题一样 难点在于去重
 // 看了别人的答案才反应过来, 去重可以这么简单的实现
 
 */

class Combination_Sum_II: NSObject {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var path = [Int]()
        _combinationSum(candidates.sorted(), target: target, index: 0, path: &path, res: &res)
        return res
    }
    func _combinationSum(_ candidates: [Int], target: Int, index: Int, path: inout [Int], res: inout [[Int]]){
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(path)
            return
        }
        for i in index..<candidates.count {
            /// 这个大于号 > 很重要,
            /// 这里的目的 去除重复的
            if i > index && candidates[i] == candidates[i - 1] {
                continue
            }
            guard candidates[i] <= target else {
                break
            }
            path.append(candidates[i])
            _combinationSum(candidates, target: target - candidates[i], index: i + 1, path: &path, res: &res)
            _ = path.popLast()
        }
    }
}
