//
//  String to Integer (atoi).swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 
 */
class StringToInteger {
    func myAtoi(_ str: String) -> Int {
        let chars = [Character](str.characters)
        var result = 0;
        var prefix = true
        var sign = 0
        for c in chars {
            if c == " " && prefix {
                continue
            }
            prefix = false
            if c >= "0" && c <= "9" {
                let cValue = Int(String(c))!
                if sign >= 0 && result > (Int(Int32.max) - cValue) / 10 {
                    result = Int(Int32.max)
                    break;
                }
                if sign == -1 && result > (-Int(Int32.min) - cValue) / 10 {
                    result = -Int(Int32.min)
                    break;
                }
                result = result * 10 + cValue
            } else if c == "+" || c == "-" {
                if sign != 0 {
                    break
                }
                sign = c == "+" ? 1 : -1
            } else {
                break;
            }
        }
        return result * (sign == 0 ? 1 : sign)
    }
}
