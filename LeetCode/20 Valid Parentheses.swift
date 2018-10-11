//
//  Valid Parentheses.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 
 
 
 // 突然想到一种思路 就就是 从前想后找,  每一个位置对应一个缺失表
 
 */

class ValidParentheses1 {
    func isValid(_ s: String) -> Bool {
        var position = [Character]()
        let chars = [Character](s)
        guard chars.count % 2 == 0 else { return false }
        for c in chars {
            switch c {
            case "{": position.append("}")
            case "[": position.append("]")
            case "(": position.append(")")
            case "]", "}", ")":
                if position.isEmpty || position.popLast() != c {
                    return false
                }
            default:
                fatalError()
            }
        }
        return position.isEmpty
    }
}
