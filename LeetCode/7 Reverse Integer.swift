//
//  Reverse Integer.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 Reverse digits of an integer.
 
 Example1: x = 123, return 321
 Example2: x = -123, return -321
 */

class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var num = x
        var flag = 1
        if num < 0 {
            flag = -1
            num = -num
        }
        var result = 0
        while num > 0 {
            if result > (Int(Int32.max) - num % 10) / 10 {
                return 0
            }
            result = result * 10 + num % 10
            num /= 10
        }
        return result * flag;
    }
    
    func reverse_other(_ x: Int) -> Int {
        if x > 0 {
            let result = Int(String(String(x).reversed()))!
            if result > Int(Int32.max) {
                return 0;
            }
            return result;
        } else {
            let result = Int(String(String(abs(x)).reversed()))!
            if result > Int(Int32.max) {
                return 0;
            }
            return -result;
        }
    }
}
