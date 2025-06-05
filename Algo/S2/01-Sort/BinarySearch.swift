//
//  BinarySearch.swift
//  Algo
//
//  Created by hong on 5/30/25.
//

import Foundation

class BinarySearch {
    
    /// 二分查找元素的index
    func indexOf(array: [Int], v: Int) -> Int {
        if array.isEmpty { return -1 }
        
        var begin = 0
        var end = array.count
        
        while begin < end {
            // 使用安全的方式计算中点，避免整数溢出
            let mid = begin + (end - begin) >> 1
            
            if array[mid] == v {
                return mid
            } else if array[mid] < v {
                begin = mid + 1
            } else {
                end = mid
            }
        }
        
        return -1
    }
    
    
    /// 二分查找待插入的index
    func search(array: [Int], v: Int) -> Int {
        
        return -1
    }

}
