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
 */

class DivideTwoIntegers {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard divisor > 1 else { return dividend }
        var idx = 0
        var lastDiv = 0
        var result = 0
        while (1 << idx) < dividend {
            let poss = getPoss(num: dividend)
            let pos = getPos(num: dividend, idx: idx)
            let rpos = (lastDiv<<1) + pos
            if rpos == 0 {
                lastDiv = 0
            } else if rpos < divisor {
                lastDiv = 1
            } else if rpos >= divisor {
                result = result + 1 << idx
                lastDiv = 0
            }
            idx += 1
        }
        return result >> 1
    }
    
    func getPos(num: Int, idx: Int) -> Int {
        if num & (1 << idx) > 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func getPoss(num: Int) -> [Int] {
        var idx = 0
        var nums = [Int]()
        while (1 << idx) <= num {
            nums.insert(num & (1 << idx) > 0 ? 1 : 0, at: 0)
            idx += 1
        }
        return nums;
    }
    
    
}
