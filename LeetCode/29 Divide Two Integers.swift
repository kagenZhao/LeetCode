//
//  Divide Two Integers.swift
//  LeetCode
//
//  Created by Kagen Zhao on 2017/6/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

/*
 Divide two integers without using multiplication, division and mod operator.
 
 If it is overflow, return MAX_INT.
 
理解起来挺简单, 说白了就是 dividend和divisor比较大小, 如果大于divisor, 就减去divisor 然后继续比较, 最后减了多少次结果就是多少
 
 */

class DivideTwoIntegers {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard divisor != 0 else { return Int(Int32.max) }
        guard dividend != 0 else { return 0 }
        // 首先计算出结果的符号
        // 按位异或: 只有某一个为 1 时才为 1
        let sign = (dividend < 0 ? 1 : 0) ^ (divisor < 0 ? 1 : 0)
        var dvd = abs(dividend)
        let dvs = abs(divisor)
        var result = 0
        while dvd >= dvs {
            var temp = dvs
            var multiple = 1
            while dvd >= (temp << 1) {
                temp <<= 1
                multiple <<= 1
            }
            dvd -= temp
            result += multiple
        }
        result =  sign != 0 ? -result : result
        if result > Int(Int32.max) {
            result = Int(Int32.max)
        }
        if result < Int(Int32.min) {
            result = Int(Int32.min)
        }
        return result
    }
}
