//
//  Roman To Integer.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/14.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 1-3999 之内的数字 转换 成罗马数字
 
 首先罗马数字的规范
 
 基本字符               I   V    X    L    C    D    M
 相应的阿拉伯数字表示为   1   5    10   50   100  500  1000
 
 
 */

/// 哈哈哈  超过了100%的人  哈哈哈哈!!!!(可能是巧合^_^!!)
class RomanToInteger {
    
    static let roman: [Character: Int] = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5,"I": 1]
    func romanToInt(_ s: String) -> Int {
        let chars = [Character](s)
        var result = 0
        for idx in 0..<chars.count {
            let number = RomanToInteger.roman[chars[idx]]!
            let nexNumber = RomanToInteger.roman[chars[idx + 1]]!
            if nexNumber > number {
                result -= number
            } else {
                result += number
            }
        }
        return result + RomanToInteger.roman[chars.last!]!
    }
}
