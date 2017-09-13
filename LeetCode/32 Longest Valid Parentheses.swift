//
//  31.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/8/2.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa



/*
 
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 
 For "(()", the longest valid parentheses substring is "()", which has length = 2.
 
 Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
 
 
依然用缓存区思想,  吧每一个 完整的 ) 对应的 maxL 存到缓存区 最后取最大的
 
 */

class Longest_Valid_Parentheses: NSObject {
    func longestValidParentheses(_ s: String) -> Int {
        return longestValidParentheses(chars: [Character](s.characters))
    }
    
    
    func longestValidParentheses( chars: [Character]) -> Int {
        guard chars.count >= 2 else { return 0 }
        var chars = chars
        var i = 0
        var j = chars.endIndex - 1
        while i < j, chars[i] == ")" {
            i += 1
        }
        while j > i, chars[j] == "(" {
            j -= 1
        }
        guard j - i >= 1 else { return 0 }
        
        var maxL = 0
        var dict: [Int: Int] = [:]
        var lposition = [Int]()
        for idx in i...j {
            let c = chars[idx]
            if c == "(" {
                lposition.append(idx)
            } else {
                if let l = lposition.popLast() {
                    dict.updateValue(idx - l + 1, forKey: idx)
                    if let umax = dict[l - 1] {
                        dict.updateValue(idx - l + 1 + umax, forKey: idx)
                    }
                    maxL = max(dict[idx]!, maxL)
                }
            }
        }
        return maxL
    }
}
