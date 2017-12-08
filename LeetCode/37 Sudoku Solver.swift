//
//  37 Sudoku Solver.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/12/4.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa


// 解决数独问题
/*
 [
 [".",".","9","7","4","8",".",".","."],
 ["7",".",".",".",".",".",".",".","."],
 [".","2",".","1",".","9",".",".","."],
 [".",".","7",".",".",".","2","4","."],
 [".","6","4",".","1",".","5","9","."],
 [".","9","8",".",".",".","3",".","."],
 [".",".",".","8",".","3",".","2","."],
 [".",".",".",".",".",".",".",".","6"],
 [".",".",".","2","7","5","9",".","."]
 ]
 
 */

//[["5", "1", "9", "7", "4", "8", "6", "3", "2"],
// ["7", "8", "3", "6", "5", "2", "4", "1", "9"],
// ["4", "2", "6", "1", "3", "9", "8", "7", "5"],
// ["3", "5", "7", "9", "8", "6", "2", "4", "1"],
// ["2", "6", "4", "3", "1", "7", "5", "9", "8"],
// ["1", "9", "8", "5", "2", "4", "3", "6", "7"],
// ["9", "7", "5", "8", "6", "3", "1", "2", "4"],
// ["8", "3", "2", "4", "9", "1", "7", "5", "6"],
// ["6", "4", "1", "2", "7", "5", "9", "8", "3"]]

class Sudoku_Solver: NSObject {
    // 比较慢, 再想想怎么优化
    func solveSudoku(_ board: inout [[Character]]) {
        var resultBoard = [[Character]].init(repeating: [Character].init(repeating: ".", count: 9), count: 9)
        let defaultSet: Set<Character> = ["1","2","3","4","5","6","7","8","9"]
        var pointSelected = [[Character]].init(repeating: [], count: 81)
        var pointMaybe = [Set<Character>].init(repeating: [], count: 81)
        var (setHs, setVs, setCs, _) = sets(for: board)
        var (i, j) = (0, 0)
        while i < 9, i >= 0, j < 9 {
            while i < 9, i >= 0, j < 9 {
                let index = i * 9 + j
                if board[i][j] == "." {
                    var all: Set<Character> = []
                    all.formUnion(setHs[i])
                    all.formUnion(setVs[j])
                    all.formUnion(setCs[(i / 3) * 3 + (j / 3)])
                    pointMaybe[index] = defaultSet.subtracting(all).subtracting(pointSelected[index])
                    if let result = pointMaybe[index].first {
                        pointSelected[index].append(result)
                        setHs[i].insert(result)
                        setVs[j].insert(result)
                        setCs[(i / 3) * 3 + (j / 3)].insert(result)
                        resultBoard[i][j] = result
                        j += 1
                        if j >= 9 {
                            i += 1
                            j = 0
                        }
                    } else {
                        while i >= 0, j >= 0, pointMaybe[i * 9 + j].count <= 1 {
                            pointSelected[i * 9 + j] = []
                            j -= 1
                            if j < 0 {
                                i -= 1
                                j = 8
                            }
                            if i >= 0, pointSelected[i * 9 + j].count > 0 {
                                setHs[i].remove(pointSelected[i * 9 + j].last!)
                                setVs[j].remove(pointSelected[i * 9 + j].last!)
                                setCs[(i / 3) * 3 + (j / 3)].remove(pointSelected[i * 9 + j].last!)
                            }
                        }
                        i = max(i, 0)
                    }
                } else {
                    pointMaybe[index] = [board[i][j]]
                    resultBoard[i][j] = board[i][j]
                    j += 1
                    if j >= 9 {
                        i += 1
                        j = 0
                    }
                }
            }
        }
        board = resultBoard
    }
    
    static var indexPaths: [(Int, Int)]!
    func solveSudoku2(_ board: inout [[Character]]) {
        guard let firstPoint = findFirstPoint(board: board) else { return }
        let (setH, setV, setC, ips) = sets(for: board)
        let info = (setH, setV, setC)
        Sudoku_Solver.indexPaths = ips
        let posb = possibility(for: firstPoint.0, pointy: firstPoint.1, info: info)
        for pos in posb {
            if let res = findPointRight(for: firstPoint.0, pointy: firstPoint.1, try: pos, board: board, info: info) {
                board = res
                break
            }
        }
    }
    
    func findPointRight(for pointx: Int, pointy: Int, try: Character, board: [[Character]], info: ([Set<Character>], [Set<Character>], [Set<Character>])) -> [[Character]]? {
        var board = board
        board[pointx][pointy] = `try`
        if pointx == 8, pointy == 8 {
            return board
        }
        var info = info
        info.0[pointx].insert(`try`)
        info.1[pointy].insert(`try`)
        info.2[(pointx / 3) * 3 + (pointy / 3)].insert(`try`)
        for ips in (pointx * 9 + pointy + 1)..<81 {
            let (i, j) = Sudoku_Solver.indexPaths[ips]
            guard board[i][j] == "." else {
                continue
            }
            let posb = possibility(for: i, pointy: j, info: info)
            guard posb.count > 0 else {
                return nil
            }
            for pos in posb {
                if let res = findPointRight(for: i, pointy: j, try: pos, board: board, info: info) {
                    return res
                }
            }
        }
        return nil
    }
    
    func findFirstPoint(board: [[Character]]) -> (Int, Int)? {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    func possibility(for pointx: Int, pointy: Int, info: ([Set<Character>], [Set<Character>], [Set<Character>])) -> Set<Character> {
        let defaultSet: Set<Character> = ["1","2","3","4","5","6","7","8","9"]
        var all: Set<Character> = []
        all.formUnion(info.0[pointx])
        all.formUnion(info.1[pointy])
        all.formUnion(info.2[(pointx / 3) * 3 + (pointy / 3)])
        return defaultSet.subtracting(all)
    }
    
    
    func sets(for board: [[Character]]) -> ([Set<Character>], [Set<Character>], [Set<Character>], [(Int, Int)]) {
        var setHs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        var setVs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        var setCs = [Set<Character>].init(repeating: Set<Character>(), count: 9)
        var indexPaths = [(Int, Int)]()
        for i in 0..<9 {
            for j in 0..<9 {
                indexPaths.append((i, j))
                guard board[i][j] != "." else { continue }
                setHs[i].insert(board[i][j])
                setVs[j].insert(board[i][j])
                setCs[(i / 3) * 3 + (j / 3)].insert(board[i][j])
            }
        }
        return (setHs, setVs, setCs, indexPaths)
    }
}
