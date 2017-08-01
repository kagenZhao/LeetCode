//
//  Longest Common Prefix.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/14.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 Write a function to find the longest common prefix string amongst an array of strings.
 编写一个函数来找到最长公共前缀字符串在字符串数组。
 
 注意: 是<公共>前缀, 意思是所有的字符串都要符合
 
 */

class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var s = strs.sorted()
        let firstChars = [Character](s[0].characters)
        let lastChars = [Character](s.last!.characters)
        let count = min(firstChars.count, lastChars.count)
        var i = 0
        if count >= 0 {
            while i < count && firstChars[i] == lastChars[i]  {
                i += 1
            }
            return String(firstChars.prefix(i))
        }
        return ""
    }
}
