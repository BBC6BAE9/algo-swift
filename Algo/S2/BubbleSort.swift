//
//  BubbleSort.swift
//  Algo
//
//  Created by hong on 5/20/25.
//

import Foundation

func bubbleSort(array: [Int]) -> [Int] {
    
    var array = array
    
    for end in (0..<array.count - 1).reversed() {
        for begin in 1..<array.count {
            if array[begin] < array[begin - 1] {
                let tmp = array[begin]
                array[begin] = array[begin - 1]
                array[begin - 1] = tmp
            }
        }
    }
    
    return array
}


