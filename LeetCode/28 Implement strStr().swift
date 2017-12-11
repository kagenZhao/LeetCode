//
//  Implement strStr().swift
//  LeetCode
//
//  Created by Kagen Zhao on 2017/6/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 Implement strStr().
 
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 */

class ImplementStrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hayChars = [Character](haystack)
        let needleChars = [Character](needle)
        guard hayChars.count >= needleChars.count else { return -1 }
        guard needleChars.count > 0 else { return 0 }
        var i = 0
        var j = 0
        while i < hayChars.count, j < needleChars.count {
            if hayChars[i] == needleChars[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1
                j = 0
            }
        }
        return j == needleChars.count ? i - j : -1
    }
}
