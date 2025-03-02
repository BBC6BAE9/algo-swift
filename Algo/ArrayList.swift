//
//  ArrayList.swift
//  Algo
//
//  Created by hong on 2/23/25.
//

import Foundation

// 动态数组
class ArrayList<E: Equatable> {
    
    /// 元素的数量
    private var _size: Int = 0
    
    /// 所有的元素
    private var elements: [E?]
    
    /// 默认容量
    private static var DEFAULT_CAPACITY: Int {
        return 10
    }
    
    /// 元素没找到
    private static var ELEMENT_NOT_FOUND: Int {
        return -1
    }
    
    /// 构造方法
    /// - Parameter capacity: 容量
    init(capacity: Int = DEFAULT_CAPACITY) {
        let capacity = (capacity < ArrayList.DEFAULT_CAPACITY) ? ArrayList.DEFAULT_CAPACITY : capacity
        self.elements = [E?](repeating: nil, count: capacity)
    }
    
    /// 清除所有元素
    func clear() {
        for i in 0..<_size {
            elements[i] = nil
        }
        _size = 0
    }
    
    /// 元素的数量
    func size() -> Int {
        return _size
    }
    
    /// 是否为空
    func isEmpty() -> Bool {
        return _size == 0
    }
    
    /// 是否包含某个元素
    func contains(element: E) -> Bool {
        return indexOf(element: element) != ArrayList.ELEMENT_NOT_FOUND
    }
    
    /// 添加一个元素
    func add(element: E) {
        add(index: _size, element: element)
    }
    
    /// 获取index位置的元素
    func get(index: Int) -> E? {
        
        rangeCheck(index: index)
        
        return elements[index]
    }
    
    /// 设置index位置的元素
    /// - Parameters:
    /// - Returns: 原来的元素
    func set(index: Int, element: E) -> E? {
        
        rangeCheck(index: index)
        
        let old = elements[index]
        elements[index] = element
        return old
    }
    
    /// 在index位置的添加一个元素
    func add(index: Int, element: E) {
        
        rangeCheckForAdd(index: index)
        
        ensureCapacity(capacity: _size + 1)
        
        for i in (index..<_size).reversed() {
            elements[i+1] = elements[i]
        }
        
        elements[index] = element
        
        _size += 1
        
    }
    
    /// 删除index位置的元素
    func remove(index: Int) -> E? {
        
        rangeCheck(index: index)
        
        let old = elements[index]
        for i in index + 1..<_size-1 {
            elements[i-1] = elements[i]
        }
        _size -= 1
        elements[_size] = nil
        return old
        
    }
    
    /// 查看元素的索引
    func indexOf(element: E) -> Int {
        for i in 0..<_size {
            if (elements[i] == element) {
                return i
            }
        }
        return ArrayList.ELEMENT_NOT_FOUND
    }
    
    /// 越界检查
    private func rangeCheck(index: Int) {
        if (index < 0 || index >= _size) {
            fatalError("Index out of bounds")
        }
    }
    
    /// add相关方法的越界检查
    private func rangeCheckForAdd(index: Int) {
        if (index < 0 || index > _size) {
            fatalError("Index out of bounds")
        }
    }
    
    /// 抛出越界错误
    private func outOFBounds() {
        fatalError("Index out of bounds")
    }
    
    /// 保证容量
    func ensureCapacity(capacity: Int) {
        let oldCapacity = elements.count
        if oldCapacity > capacity {
            return
        }
        // 扩容1.5倍
        // 位运算，右移一位，相当于除以2
        let newCapacity = oldCapacity + (oldCapacity >> 1)
        var newElements = [E?](repeating: nil, count: newCapacity)
        
        for i in 0..<_size {
            newElements[i] = elements[i]
        }
        self.elements = newElements
        
        print("old capacity = \(oldCapacity), new capacity = \(newCapacity)")
    }
    
}
