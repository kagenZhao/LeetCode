//
//  36 Valid Sudoku.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/9/14.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa


/*
 验证数独
 行/列 包含1-9
 每个块 包含1-9
 
 解: 很好理解
 本题对内存没有要求,
 所以创建横排的 [Set] ,纵排的 [Set], 还有9个块的[Set]
 然后一个一个判断, 遇见 "."就忽略
 把每个数字分别加入 相应的 横排Set 纵排Set 和块Set
 如果添加不进去就 return false
 如果全部添加进去 return true
 */
class Valid_Sudoku: NSObject {
    // 空白的地方用.代替
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var setHs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        var setVs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        var setCs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                guard board[i][j] != "." else { continue }
                let (insertedH, _) = setHs[i].insert(board[i][j])
                let (insertedV, _) = setVs[j].insert(board[i][j])
                let (insertedC, _) = setCs[(i / 3) * 3 + (j / 3)].insert(board[i][j])
                guard insertedH, insertedV, insertedC else {
                    return false
                }
            }
        }
        return true
    }
}
