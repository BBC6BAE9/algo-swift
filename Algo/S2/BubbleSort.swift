//
//  BubbleSort.swift
//  Algo
//
//  Created by hong on 5/20/25.
//

import Foundation

/// 冒泡排序
func bubbleSort(array: inout [Int]){
    for end in (1..<array.count).reversed() {
        for begin in 1...end {
            if array[begin] < array[begin - 1] {
                let tmp = array[begin]
                array[begin] = array[begin - 1]
                array[begin - 1] = tmp
            }
        }
    }
}

/// 冒泡排序优化1
/// 思路：如果给出的序列已经完全有序，可以提前终止冒泡排序
func bubbleSort1(array: inout [Int]) {
    for end in (1..<array.count).reversed() {
        var sorted = true
        for begin in 1...end {
            if array[begin] < array[begin - 1] {
                let tmp = array[begin]
                array[begin] = array[begin - 1]
                array[begin - 1] = tmp
                sorted = false
            }
        }
        
        if sorted { break }
    }
}

/// 冒泡排序优化2
/// 思路：如果序列尾部已经局部有序，可以记录最后一次交换的位置，减少比较的次数
func bubbleSort2(array: inout [Int]) {
    var end = array.count - 1 // 初始化终点位置为最后一个索引
    
    while end >= 1 {
        var sortedIndex = 0
        
        for begin in 1...end {
            if array[begin] < array[begin - 1] {
                let tmp = array[begin]
                array[begin] = array[begin - 1]
                array[begin - 1] = tmp
                
                sortedIndex = begin
            }
        }
        end = sortedIndex
    }
}
