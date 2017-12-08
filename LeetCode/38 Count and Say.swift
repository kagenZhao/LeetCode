//
//  38 Count and Say.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/12/7.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa


/*
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 6.     312211
 7.     13112221
 
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 Given an integer n, generate the nth term of the count-and-say sequence.
 
 
 这个没什么好办法 就是 一个接一个的计算
 */

class Count_and_Say: NSObject {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        var res = "1"
        var tempRes = ""
        for _ in 1..<n {
            tempRes = ""
            var chars = [Character](res)
            var repeatStr = chars[0]
            var count = 1
            for i in 1..<chars.count {
                if repeatStr == chars[i] {
                    count += 1
                } else {
                    tempRes.append("\(count)")
                    tempRes.append(repeatStr)
                    repeatStr = chars[i]
                    count = 1
                }
            }
            tempRes.append("\(count)")
            tempRes.append(repeatStr)
            res = tempRes
        }
        return res
    }


}
