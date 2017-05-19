//
//  Generate Parentheses.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/19.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 很简单 递归判断 只要 左右括号数量相等 = n 就行
 注意 右括号的添加需要当前做扩考的数量小于 右括号
 
 */


class GenerateParentheses {
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {return []}
        guard n > 1 else { return ["()"]}
        func add(_ s: String, lCount: Int, rCount: Int, count: Int) -> [String] {
            if count == n * 2 {
                return [s]
            }
            var s1 = [String]()
            if lCount > 0 && rCount < lCount {
                s1 = add(s + ")", lCount: lCount, rCount: rCount + 1, count: count + 1)
            }
            var s2 = [String]()
            if lCount < n {
                s2 = add(s + "(", lCount: lCount + 1, rCount: rCount, count: count + 1)
            }
            return s1 + s2
        }
        return add("(", lCount: 1, rCount: 0, count: 1)
    }
}
