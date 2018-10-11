//
//  Letter Combinations of a Phone Number.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 */

// 完全自己想的
class LetterCombinationsOfAPhoneNumber {
    static let telStrs: [Character: [String]] = ["1": ["1"], "2": ["a", "b", "c"], "3": ["d", "e", "f"], "4": ["g", "h", "i"], "5": ["j", "k", "l"],
                                                 "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"], "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"], "0": ["0"]]
    func letterCombinations(_ digits: String) -> [String] {
        return digits
            .reduce([]) { (r, c)  in
                return r + [LetterCombinationsOfAPhoneNumber.telStrs[c]!]
            }.reduce([]) { (r, ss) in
                return ss.flatMap({ (s) in
                    return (r.isEmpty ? [""] : r).map({ "\($0)\(s)" })
                })
        }
    }
}
