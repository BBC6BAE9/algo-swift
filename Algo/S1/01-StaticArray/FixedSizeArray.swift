//
//  FixedSizeArray.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

/// 用Swift 的高级数组模拟早期变成语言中数组的有限能力
class FixedSizeArray<E> {
    
    private var elements: [E?]
    
    init(capacity: Int = DEFAULT_CAPACITY) {
        self.elements = [E?](repeating: nil, count: capacity)
    }
    
    // TODO: 这个地方是不是需要把返回值改成E
    subscript(index: Int) -> E? {
        get {
            checkBounds(index)
            return elements[index]
        }
        
        set {
            // Check if index is valid
            checkBounds(index)
            elements[index] = newValue
        }
    }
    
    var length: Int {
        return size()
    }
    
    func size() -> Int {
        return elements.count
    }
    
    /// 检查边界值
    private func checkBounds(_ index: Int) {
        // Check if index is valid
        guard index >= 0 && index < elements.count else {
            fatalError("out of bounds")
        }
    }
    
}
