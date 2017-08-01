//
//  ReqularExpressionMatching.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/4/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 
 实现正则表达式与支持匹配'.'和'*'。
 
 '' 匹配任何单个字符。
 '*'匹配零个或多个前面的元素。
 
 匹配应该覆盖整个输入字符串（不是部分的）。
 
 功能原型应为：
 bool isMatch（const char * s，const char * p）
 
 一些例子：
 isMatch（“aa”，“a”）→false
 isMatch（“aa”，“aa”）→true
 isMatch（“aaa”，“aa”）→false
 isMatch（“aa”，“a *”）→true
 isMatch（“aa”，“。*”）→true
 isMatch（“ab”，“。*”）→true
 isMatch（“aab”，“c * a * b”）→true
 */

/// 参考 动态规划 所实现 还没看懂
class ReqularExpressionMatching1 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard s != p else { return true }
        guard !p.isEmpty else { return false }
        var chars = [Character](s.characters)
        var regs = [Character](p.characters)
        // 表示 s的前i个和p的前j个匹配程度
        var res = [[Bool]].init(repeating: [Bool](repeating: false, count: regs.count + 1), count: chars.count + 1)
        res[0][0] = true
        for j in 0..<regs.count {
            if regs[j] == "*" {
                
                // s = abcdabca p = accc*
                if j > 0 && res[0][j - 1] {
                    res[0][j + 1] = true
                }
                if j < 1 {
                    continue
                }
                if regs[j - 1] != "." {
                    for i in 0..<chars.count {
                        if res[i + 1][j] ||
                            (j > 0 && res[i + 1][j - 1]) ||
                            (i > 0 && j > 0 && res[i][j + 1] && chars[i] == chars[i - 1] && chars[i - 1] == regs[j - 1]) {
                            res[i + 1][j + 1] = true
                        }
                    }
                } else {
                    var i = 0
                    while j > 0 && i < chars.count && !res[i + 1][j - 1] && !res[i + 1][j] {
                        i += 1
                    }
                    for i in i..<chars.count {
                        res[i + 1][j + 1] = true
                    }
                }
            } else {
                for i in 0..<chars.count {
                    if chars[i] == regs[j] || regs[j] == "." {
                        res[i + 1][j + 1] = res[i][j]
                    }
                }
            }
        }
        print(res)
        return res[chars.count][regs.count]
    }
}


/// 这是我自己实现的
class ReqularExpressionMatching2 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard s != p else { return true }
        guard p != ".*" else { return true }
        
        let chars = [Character](s.characters)
        let regs = [Character](p.characters)
        
        return matchStr(chars, fixStr(regs))
    }
    
    func matchStr(_ s: [Character], _ p: [Character]) -> Bool {
        
        guard !p.isEmpty else { return s.isEmpty }
        guard s != p else  { return true }
        if s.isEmpty {
            var k = 0
            while k < p.count {
                if k + 1 < p.count, p[k + 1] == "*" {
                    k += 2
                } else {
                    return false
                }
            }
            return true
        }
        if s[0] == p[0] {
            if p.count > 1 && p[1] == "*" { // 相等 且 下一个是 *
                return matchStr([Character](s), [Character](p.dropFirst(2))) ||
                    matchStr([Character](s.dropFirst()), [Character](p)) ||
                    matchStr([Character](s.dropFirst()), [Character](p.dropFirst(2)))
            } else if 1 >= p.count { // 相等 且 没有下一个
                return matchStr([Character](s.dropFirst()), [Character](p.dropFirst()))
            } else { // 相等 且下一个不是 *
                return matchStr([Character](s.dropFirst()), [Character](p.dropFirst()))
            }
        } else {
            if p[0] == "." {
                if 1 < p.count && p[1] == "*" { // 不相等 是 .*
                    return matchStr([Character](s), [Character](p.dropFirst(2))) ||
                        matchStr([Character](s.dropFirst()), [Character](p.dropFirst(2))) ||
                        matchStr([Character](s.dropFirst()), [Character](p))
                } else if 1 >= p.count { // 不相等 是 .
                    return s.count == 1
                } else { // 不相等 是 .x
                    return matchStr([Character](s.dropFirst()), [Character](p.dropFirst()))
                }
            } else {
                if 1 < p.count && p[1] == "*" { // 不相等 是 x*
                    return matchStr([Character](s), [Character](p.dropFirst(2)))
                } else if 1 >= p.count { // 不相等 是 x
                    return false
                } else { // 不相等 是 xx
                    return false
                }
            }
        }
    }
    func fixStr(_ s: [Character]) -> [Character] {
        var s = s
        var i = 0
        var j = s.count
        while i < j {
            if i + 1 < j && s[i + 1] == "*" {
                if i + 2 < j, i + 3 < j {
                    if s[i + 3] == "*" {
                        if s[i + 2] == s[i]{
                            s.remove(at: i)
                            s.remove(at: i)
                            j -= 2
                            continue
                        } else if s[i + 2] == "." {
                            s.remove(at: i)
                            s.remove(at: i)
                            s[i] = "."
                            j -= 2
                            continue
                        }
                        
                    }
                }
            }
            i += 1
        }
        return s
    }
}
