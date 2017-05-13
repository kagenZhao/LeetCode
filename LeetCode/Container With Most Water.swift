//
//  ContainerWithMostWater.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/5/13.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation


/*
 给定n个非负整数a 1，a 2，...，a n，其中每个表示坐标（i，a i）处的点。绘制n条垂直线，使得线i的两个端点在（i，a i）和（i，0）处。找到两条线，它们与x轴一起形成一个容器，使得容器含有最多的水。
 
 注意：您不能倾斜容器，n至少为2。
 */
/// 解题重点是: 水装的多少跟最低线有关,  所以先从宽长的开始算, 如果下一个比前一个矮 水不可能会多 所以继续向前找, 两端同时逼近
class ContainerWithMostWater {
    
    func maxArea(_ height: [Int]) -> Int {
        var maxV = 0
        var i = 0
        var j = height.count - 1
        while i < j {
            let h = min(height[i], height[j])
            maxV = max(maxV, (j - i) * h)
            while i < j, height[i] <= h { i += 1 }
            while i < j, height[j] <= h { j -= 1 }
        }
        return maxV
    }
}
