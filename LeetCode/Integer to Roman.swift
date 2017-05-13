//
//  Integer to Roman.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 1-3999 之内的数字 转换 成罗马数字
 
 首先罗马数字的规范
 
 基本字符               I   V    X    L    C    D    M
 相应的阿拉伯数字表示为   1   5    10   50   100  500  1000

 
 */

class IntegerToRoman {
    let roman = [["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
                 ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
                 ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
                 ["", "M", "MM", "MMM"]]
    func intToRoman(_ num: Int) -> String {
        var romanStr = ""
        romanStr += roman[3][num / 1000 % 10]
        romanStr += roman[2][num / 100 % 10]
        romanStr += roman[1][num / 10 % 10]
        romanStr += roman[0][num % 10]
        return romanStr
    }
}
