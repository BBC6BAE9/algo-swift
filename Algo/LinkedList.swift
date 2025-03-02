//
//  LinkedList.swift
//  Algo
//
//  Created by hong on 2/23/25.
//

import Foundation

// 链表
class LinkedList<E>: List {
    
    private var _size: Int
    
    private var firstNode: Node<E>
    
    init(size: Int, firstNode: Node<E>) {
        self._size = size
        self.firstNode = firstNode
    }
    
    class Node<T> {
        var element: T
        var next: Node<T>
        
        init(element: T, next: Node<T>) {
            self.element = element
            self.next = next
        }
        
    }
    
    // MARK: 接口实现
    
    func clear() {
        
    }
    
    func size() -> Int {
        return 0
    }
    
    func isEmpty() -> Bool {
        return false
    }
    
    func contains(element: E) -> Bool {
        return false
    }
    
    func add(element: E) {
        
    }
    
    func get(index: Int) -> E {
        return self.firstNode.element
    }
    
    func set(index: Int, element: E) -> E {
        return element
    }
    
    func add(index: Int, element: E) -> Bool {
        return false
    }
    
    func remove(index: Int) -> E {
        return self.firstNode.element
    }
    
    func indexOf(element: E) -> Int {
        return 0
    }
}

extension LinkedList {
    func fuck(){
        print("---------fuck")
    }
}
/*
 链表
 动态数组的明显缺点，可能会造成内存空间的大量浪费，能否用到多少内存就使用多少内存？链表就可以用到这一点，链表是一种链式存储的线性表，所有的内存地址不一定是连续的
 */
