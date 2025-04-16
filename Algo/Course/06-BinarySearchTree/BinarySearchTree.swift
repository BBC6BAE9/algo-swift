//
//  BinarySearchTree.swift
//  Algo
//
//  Created by hong on 4/16/25.
//

import Foundation

/// 二叉搜索树
class BinarySearchTree<T: Comparable> {
    
    private var size: Int = 0
    
    var root: Node<T>?
    
    // MARK: - BinaryTreeInfo Protocol
    
    func getRoot() -> Any? {
        return root
    }
    
    /// 二叉树的高度
    func height() -> Int {
        let height = height(node: root)
        return height
    }
    
    private func height(node: Node<T>?) -> Int {
        if node == nil {
            return 0
        }
        let left = height(node: node?.left)
        let right = height(node: node?.left)
        return 1 + max(left, right)
    }
    
    func left(_ node: Any?) -> Any? {
        guard let node = node as? Node<T> else { return nil }
        return node.left
    }
    
    func right(_ node: Any?) -> Any? {
        guard let node = node as? Node<T> else { return nil }
        return node.right
    }
    
    func string(_ node: Any?) -> String {
        guard let node = node as? Node<T> else { return "" }
        return "\(node.element)"
    }
    
    // MARK: - Tree Operations
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func clear(){
        
    }
    
    func add(element: T) {
        
        guard let root = root else { // 添加第一个节点
            root = Node(element: element, parent: nil)
            size += 1;
            return
        }
        
        var node: Node<T>?  = root
        
        
        var parentNode: Node<T> = root
        var cmp: Int = 0
        while node != nil {
            
            parentNode = node!
            
            // 添加的不是第一个节点
            cmp = compare(e1: element, e2: node!.element)
            if cmp > 0 {
                node = node!.right
            } else if cmp < 0 {
                node = node!.left
            } else {
                node?.element = element
            }
        }

        let newNode: Node<T> = Node(element: element, parent: parentNode)
        if cmp > 0 {
            parentNode.right = newNode
        }else{
            parentNode.left = newNode
        }
        
        size += 1
    }
    
    func remove(element: T) {
        
    }
    
    func contains(element: T) -> Bool {
        return false
    }
    
    /// 比较两个元素的大小
    /// - Returns: 0代表两个元素相等 大于0代表e1大于e2 返回值小于0代表e1小于e2
    private func compare(e1: T, e2: T) -> Int {
        if e1 == e2 {
            return 0
        }else if e1 > e2 {
            return 1
        }else{
            return -1
        }
    }
    
    class Node<E: Comparable> {
        var element: E
        var left: Node<E>?
        var right: Node<E>?
        var parent: Node<E>?
        
        init(element: E, parent: Node<E>?) {
            self.element = element
            self.parent = parent
        }
    }
}
