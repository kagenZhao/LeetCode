//
//  ZigZag Conversion.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/16.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation
/*
 字符串"PAYPALISHIRING"以类似于这样的给定行数的Z字形模式编写（您可能希望以固定字体显示此模式以获得更好的可读性）
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 
 And then read line by line: "PAHNAPLSIIGYIR"
 */

class ZigZagConversion {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows >= 2 else {
            return s
        }
        
        let chars = [Character](s.characters)
        
        let loop = numRows + (numRows - 2)
        var result = ""
        for rowIndex in 0 ..< numRows {
            var row = ""
            for num in stride(from:rowIndex, to:chars.count, by: loop) {
                row.append(chars[num])
                
                if rowIndex > 0 && rowIndex < numRows - 1 { // not first row, not last row
                    let next = num + (numRows - rowIndex - 1) * 2
                    
                    if next < chars.count {
                        row.append(chars[next])
                    }
                }
            }
            
            result.append(row)
        }
        
        return result
    }
}
