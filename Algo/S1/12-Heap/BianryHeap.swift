//
//  BianryHeap.swift
//  Algo
//
//  Created by hong on 5/28/25.
//

import Foundation

// 默认是最大堆
class BinaryHeap<E: Comparable>: AbstractHeap<E> {
    
    typealias E = E
    
    private var elements: FixedSizeArray<E>
    
    private var size = 0
    
    override init() {
        self.elements = FixedSizeArray.init(capacity: DEFAULT_CAPACITY)
        super.init()
    }
    
    // 清空
    override func clear() {
        for i in 0..<size {
            elements[i] = nil
        }
        size = 0
    }
    
    // 添加元素
    // element 不允许为空
    override func add(element: E) {
        // 扩容
        ensureCapacity(capacity: size + 1)
        
        elements[size] = element
        
        size += 1
        
        siftUp(index: size - 1)
    }
    
    // 上滤
    private func siftUp(index: Int) {
        /*
        var index = index
        let e = elements[index]!
        // index > 0 有父节点
        while index > 0 {
            let pindex = (index - 1) >> 1;
            let p = elements[pindex]!
            if e < p { return }
            
            // 交换
            let tmp = elements[index]
            elements[index] = elements[pindex]
            elements[pindex] = tmp
            index = pindex
        }
         */
        
        var index = index
        
        let e = elements[index]!
        
        while index > 0 {
            let pindex = (index - 1) >> 1;
            let p = elements[pindex]!
            if e < p { break }
            elements[index] = p
            index = pindex
        }
        elements[index] = e
    }
    
    // 获取堆顶元素
    override func get() -> E {
        emptyCheck()
        return elements[0]!
    }
    
    // 删除堆顶元素
    override func remove() -> E {
         
        return elements[0]!
    }
    
    // 删除堆顶元素的同时插入一个新元素
    override func replace(element: E) {
        
    }
    
    private func emptyCheck(){
        if (size == 0) {
            fatalError("Heap is empty")
        }
    }
    
    /// 动态扩容
    func ensureCapacity(capacity: Int) {
        let oldCapacity = elements.length
        if oldCapacity > capacity {
            return
        }
        // 扩容1.5倍
        // 位运算，右移一位，相当于除以2
        // 扩容倍数和所容倍数的乘积如果是1，会出现复杂度震荡，避开即可
        let newCapacity = oldCapacity + (oldCapacity >> 1)
        let newElements = FixedSizeArray<E>(capacity: newCapacity)
        
        for i in 0..<size {
            newElements[i] = elements[i]
        }
        self.elements = newElements
        
        print("old capacity = \(oldCapacity), new capacity = \(newCapacity)")
    }
    
}
