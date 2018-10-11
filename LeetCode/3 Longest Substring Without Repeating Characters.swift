//
//  Longest Substring Without Repeating Characters.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation



/*
 给定一个字符串，找到最长子串的长度，而不重复字符。
 
 例子：
 
 给定"abcabcbb"的答案是"abc"，长度是3。
 
 给定"bbbbb"的答案是"b"，长度为1。
 
 给定"pwwkew"的答案是"wke"，长度为3.请注意，答案必须是子字符串，"pwke"是子序列，而不是子字符串。
 */
class LongestSubStringWithoutRepetingCharacters {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character: Int]()
        var start = 0
        var num = 0
        for (idx, value) in s.enumerated(){
            if let i = dic[value], start <= i {
                start = i + 1
            } else {
                num = max(num, idx - start + 1)
            }
            dic[value] = idx
        }
        return num
    }
}

