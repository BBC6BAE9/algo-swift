//
//  PriorityQueue.swift
//  Algo
//
//  Created by hong on 5/29/25.
//

import Foundation

class PriorityQueue<E: Comparable> {
    
    private var heap: BinaryHeap<E> = .init()
    
    // 元素的数量
    func getSize() -> Int {
        return heap.getSize()
    }
    
    // 是否为空
    func isEmpty() -> Bool {
        return heap.isEmpty()
    } 
    
    // 入队
    func enQueue(element: E) {
        heap.add(element: element)
    }
    
    // 出队
    func deQueue() -> E? {
        return heap.remove()
    }
    
    /// 获取队头元素
    func front() -> E? {
        return heap.get()
    }
}
    

