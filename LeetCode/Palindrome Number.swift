//
//  Palindrome Number.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 判断是否是回文
 */
class PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x >= 10 else { return true }
        var tag: Int = 1
        var num = x
        while x / tag >= 10 {
            tag *= 10
        }
        while tag >= 10 {
            if num / tag != num % 10 {
                return false
            }
            num = (num % tag) / 10
            tag /= 100
        }
        return true
    }
}
