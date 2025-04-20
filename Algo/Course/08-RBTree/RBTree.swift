//
//  RBTree.swift
//  Algo
//
//  Created by hong on 4/21/25.
//

import Foundation

fileprivate let RED = false
fileprivate let BLACK = true

class RBTree<T: Comparable>: BST<T> {
    
    /// 染色
    private func color(node:Node<T>?,
                       color: Bool) -> Node<T>?
    {
        guard let node = node as? RBNode<T> else { return nil }
        node.color = color
        return node
    }
    
    /// 染红
    private func red(node:Node<T>?) -> Node<T>? {
        return color(node: node, color: RED)
    }
    
    /// 染黑
    private func black(node:Node<T>?) -> Node<T>? {
        return color(node: node, color: BLACK)
    }
    
    /// 获取节点的颜色
    private func colorOf(node: Node<T>?) -> Bool {
        return node == nil ? BLACK : (node as! RBNode<T>).color
    }
    
    /// 判断节点是否是黑色
    private func isBlack(node: Node<T>?) -> Bool {
        return colorOf(node: node) == BLACK
    }
    
    /// 判断节点是否是黑色
    private func isRed(node: Node<T>?) -> Bool {
        return colorOf(node: node) == RED
    }
    
     /// 红黑树节点
    private class RBNode<E: Comparable>: BinaryTree<T>.Node<T> {
        var color: Bool = BLACK
        override init(element: T, parent: BinaryTree<T>.Node<T>?) {
            super.init(element: element, parent: parent)
        }
    }
    
    // MARK: override
    override func afterAdd(node: BinaryTree<T>.Node<T>) {
        
    }
    
    override func afterRemove(node: BinaryTree<T>.Node<T>) {
        
    }
}
