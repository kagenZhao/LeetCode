//
//  Longest Palindromic Substring   .swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation
/*
 给定一个字符串小号，发现最长的回文子小号。您可以假设s的最大长度为1000。
 
 例：
 
 输入： “babad”
 
 输出： “bab”
 
 注意： “aba”也是一个有效的答案。
 例：
 
 输入： “cbbd”
 
 输出： “bb”
 */
class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        let chars = [Character](s.characters);
        let count = chars.count
        if count <= 1 {
            return s
        }
        var startIdx = 0;
        var maxLength = 1;
        var i = 0
        while i < count {
            if (count - i <= maxLength / 2) { break }
            var left = i
            var right = i
            while right < count && right + 1 < count && chars[right] == chars[right + 1] {
                right += 1
            }
            i = right + 1
            while left >= 0 && right < count && chars[left] == chars[right] {
                left -= 1
                right += 1
            }
            if maxLength < right - left - 1 {
                startIdx = left + 1;
                maxLength = right - left - 1
            }
        }
        return String(chars[startIdx..<(startIdx + maxLength)])
    }
}
