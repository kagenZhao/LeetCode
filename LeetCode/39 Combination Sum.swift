//
//  39 Combination Sum.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/12/7.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 For example, given candidate set [2, 3, 6, 7] and target 7,
 A solution set is:
 [
 [7],
 [2, 2, 3]
 ]
 
 递归便利
 */

class Combination_Sum: NSObject {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
            guard candidates[i] <= target else {
                break
            }
            path.append(candidates[i])
            _combinationSum(candidates, target: target - candidates[i], index: i, path: &path, res: &res)
            _ = path.popLast()
        }
    }
    
}
