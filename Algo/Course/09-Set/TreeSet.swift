//
//  TreeSet.swift
//  Algo
//
//  Created by hong on 4/21/25.
//

import Foundation

class TreeSet<T: Comparable>: SetProtocol {
    
    private var tree = RBTree<T>()
    
    func contains(element: T) -> Bool {
        return tree.contains(element: element)
    }
    
    func add(element: T) {
        return tree.add(element: element)
    }
    
    func remove(element: T) {
        return tree.remove(element: element)
    }
    
    typealias E = T
    
    func size() -> Int {
        return tree.size
    }
    
    func isEmpty() -> Bool {
        return tree.isEmpty()
    }
    
    func clear() {
        tree.clear()
    }

}
