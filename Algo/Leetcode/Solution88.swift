//
//  Solution88.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

// 88 合并两个有序数组
// https://leetcode.cn/problems/merge-sorted-array/

// TODO: 其他的解也要看看
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i1 = m - 1
        var i2 = n - 1
        var cur = nums1.count - 1
        
        while i2 >= 0 {
            if i1 >= 0  && nums2[i2] < nums1[i1]{
                nums1[cur] = nums1[i1]
                i1 -= 1
                cur -= 1
            } else {
                nums1[cur] = nums2[i2]
                i2 -= 1
                cur -= 1
            }
              
        }
    }
}

// 1 3 5 0 0 0
// 2 4 6

// 1 3 5(i1) 0 0 0(cur)
// 2 4 6(i2)
