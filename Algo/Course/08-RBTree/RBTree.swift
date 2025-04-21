//
//  RBTree.swift
//  Algo
//
//  Created by hong on 4/21/25.
//

import Foundation

fileprivate let RED = false
fileprivate let BLACK = true

class RBTree<T: Comparable>: BBST<T> {
    
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
    
    // MARK: override
    override func afterAdd(node: BinaryTree<T>.Node<T>) {
        let parent = node.parent
        
        // 添加的是根节点
        guard let parent = parent else {
            _ = black(node: node)
            return
        }
        
        // 如果父节点是黑色，直接返回
        if isBlack(node: parent) { return }
        
        // 叔父节点
        let uncle = parent.sibling()
        
        // 祖父节点
        let grand = parent.parent
        
        if isRed(node: uncle) { // 叔父节点是红色
            _ = black(node: parent)
            _ = black(node: uncle)
            
            afterAdd(node: red(node: grand)!)
            return
        }
        
        // 叔父节点不是红色
        if (parent.isLeftChild()) { // L
            _ = red(node: grand)
            if node.isLeftChild() { // LL
                _ = black(node: parent)
            } else { // LR
                _ = black(node: node)
                rotateLeft(grand: parent)
            }
            rotateRight(grand: grand)
        } else { // R
            _ = red(node: grand)
            if node.isLeftChild() { // RL
                _ = black(node: node)
                rotateRight(grand: parent)
            } else { // RR
                _ = black(node: parent)
            }
            rotateLeft(grand: grand)
        }
    }
    
    override func afterRemove(node: BinaryTree<T>.Node<T>) {
        
    }
    
    override func createNode(element: T, parent: BinaryTree<T>.Node<T>?) -> BinaryTree<T>.Node<T> {
        return RBNode<T>(element: element, parent: parent)
    }
    
    /// 红黑树节点
    private class RBNode<E: Comparable>: BinaryTree<T>.Node<T> {
        var color: Bool = RED
        
        override init(element: T, parent: BinaryTree<T>.Node<T>?) {
            super.init(element: element, parent: parent)
        }
    }
}
