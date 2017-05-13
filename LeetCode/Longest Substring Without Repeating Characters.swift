//
//  Longest Substring Without Repeating Characters.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

class LongestSubStringWithoutRepetingCharacters {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character: Int]()
        var start = 0
        var num = 0
        for (idx, value) in s.characters.enumerated(){
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

