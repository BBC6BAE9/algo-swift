//
//  BubbleSort.swift
//  Algo
//
//  Created by hong on 5/20/25.
//

import Foundation

class Sort  {
    
    public var array: [Int] = []
    var cmpCount: Int = 0
    var swapCount: Int = 0

    public func sort(array: inout [Int]){
        if array.count < 2 { return }
        self.array = array
        sort()
        // Update the original array with the sorted array
        array = self.array
    }
    
    func sort() {
        fatalError()
    }
    
    /// 比较两个元素的大小
    /// - Returns: 返回值等于0，代表 array[i1] == array[i2]
    ///            返回值小于0，代表 array[i1] < array[i2]
    ///            返回值大于0，代表 array[i1] > array[i2]
    public func cmp(i1: Int, i2: Int) -> Int {
        cmpCount += 1
        return array[i1] - array[i2]
    }
    
    public func cmpElements(v1: Int, v2: Int) -> Int {
        cmpCount += 1
        return v1 - v2
    }
    
    /// 交换两个元素的位置
    public func swap(i1: Int, i2: Int) {
        swapCount += 1
        let tmp = array[i1]
        array[i1] = array[i2]
        array[i2] = tmp
    }
}

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


/// 选择排序
func selelctionSort(array: inout [Int]) {
    for end in (1..<array.count).reversed() {
        var maxIndex = 0
        for begin in 1...end {
            if array[maxIndex] <= array[begin] {
                maxIndex = begin
            }
        }
        
        let tmp = array[maxIndex]
        array[maxIndex] = array[end]
        array[end] = tmp
    }
}
