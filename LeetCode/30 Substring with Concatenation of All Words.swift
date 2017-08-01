//
//  30.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/7/31.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Cocoa

/*
 You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
 
 For example, given:
 s: "barfoothefoobarman"
 words: ["foo", "bar"]
 
 You should return the indices: [0,9].
 (order does not matter).
 
 
 给定 字符串s 和 字符串数组 words,  words中字符串等长 查找 word中所有字符串的随机顺序链接 在 s中的索引, 结果顺序随意
 
 
 第一想法 :  利用缓存区
顺序便利s的每一个字符
 取出字符后连接的words内字符长度的字符串, 并判断是否在words中,
 如果在words中, 将在words中的索引存入对应 当前字符首位索引对应的 buff中
 取出前一组的buff 把其中 与上边索引相同之后的数据一并存入buff 中
 以此类推
 当某个buff中的个数等于word个数 就添加进结果
 但是 结果超时  不知道什么原因 网上目前没有找到通过的 swift 版本
 */

class SubstringwithConcatenationofAllWords: NSObject {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard words.count > 0 else { return [] }
        let lengh = words[0].characters.count
        guard lengh > 0 else { return [] }
        guard s.characters.count >= words.count * lengh else { return [] }
        let chars = [Character](s.characters)
        let allCount = words.count
        var buffC = [[Int]].init(repeating: [], count: chars.count)
        var result = [Int]()
        for cidx in 0..<chars.count {
            guard cidx + lengh <= chars.count else { break }
            var replaceFindIdx = [Int]()
            let c = String(chars[cidx..<cidx + lengh])
            if let findidx = words.index(of: c) {
                buffC[cidx].append(findidx)
                var temp = words[(findidx + 1)..<words.endIndex]
                while let ref = temp.index(of: c) {
                    replaceFindIdx.append(ref)
                    temp = words[(ref + 1)..<words.endIndex]
                }
            }
            
            if cidx >= lengh {
                if let findIdx = buffC[cidx].first {
                    if !buffC[cidx - lengh].contains(findIdx) {
                        buffC[cidx].insert(contentsOf: buffC[cidx - lengh], at: 0)
                    } else {
                        if replaceFindIdx.count > 0 {
                            var allContains = true
                            for rep in replaceFindIdx {
                                if !buffC[cidx - lengh].contains(rep) {
                                    buffC[cidx] = [rep]
                                    buffC[cidx].insert(contentsOf: buffC[cidx - lengh], at: 0)
                                    allContains = false
                                    break
                                }
                            }
                            if allContains {
                                let containIdx = buffC[cidx - lengh].index(of: findIdx)!
                                buffC[cidx].insert(contentsOf: buffC[cidx - lengh][(containIdx + 1)..<buffC[cidx - lengh].endIndex], at: 0)
                            }
                        } else {
                            let containIdx = buffC[cidx - lengh].index(of: findIdx)!
                            buffC[cidx].insert(contentsOf: buffC[cidx - lengh][(containIdx + 1)..<buffC[cidx - lengh].endIndex], at: 0)
                        }
                    }
                }
            }
            if buffC[cidx].count == allCount {
                result.append(cidx - (lengh * (allCount - 1)))
                buffC[cidx].removeFirst()
            }
        }
        return result
    }
}
