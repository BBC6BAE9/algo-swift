//
//  FixedSizeArray.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

class FixedSizeArray<E> {
    
    private var elements: [E?]
    
    init(capacity: Int = DEFAULT_CAPACITY) {
        self.elements = [E?](repeating: nil, count: capacity)
    }
    
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
