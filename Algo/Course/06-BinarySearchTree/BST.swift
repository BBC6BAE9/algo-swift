//
//  BinarySearchTree.swift
//  Algo
//
//  Created by hong on 4/16/25.
//

// 相关练习：Solution226 翻转二叉树
import Foundation

// TODO: 参考下面的OC代码写一个打印二叉树的功能 https://github.com/CoderMJLee/BinaryTrees/blob/master/BinaryTreePrinterOC/BinaryTreePrinterOC/MJBinaryTrees/MJBinaryTrees.m
/// 二叉搜索树
class BST<T: Comparable>: BianryTree<T> {
    
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
    
    public func remove(element: T) {
        remove(node: node(element: element))
    }
    
    private func removeElement(element: T) {
        remove(node: node(element: element))
    }
    
    private func contains(element: T) -> Bool {
        node(element: element) != nil
    }
    
    private func remove(node: Node<T>?) {
        var node = node
        if node == nil { return }
        
        size -= 1
         
        // 1、删除叶子节点：直接删除
        // 2、删除度为1的节点：用子节点替代原节点的位置即可
        // 3、删除度为2的节点：找到前驱节点或者后继节点来替代原节点的位置，以维持搜索二叉树的性质
        
        if node!.hasTwoChildren() {
            let s = successor(node: node)!
            node!.element = s.element
            node = s
        }
        
        // 删除node节点（node的度必然是1或者0）
        let replacementNode = node?.left != nil ? node?.left : node?.right
        if replacementNode != nil { // node是度为1的节点
            replacementNode?.parent = node?.parent
            if node?.parent == nil {
                root = replacementNode
            }else if node == node?.parent?.left {
                node?.parent?.left = replacementNode
            }else {
                node?.parent?.right = replacementNode
            }
        } else if(node?.parent == nil){ // node是叶子节点且是根节点
            root = nil
        }else{ // node是叶子节点，但不是根节点
            if(node == node?.parent?.left) {
                node?.parent?.left = nil
            } else {
                node?.parent?.right = nil
            }
        }
    }
    
    /// 根据元素寻找节点
    private func node(element: T) -> Node<T>? {
        var node = root
        while node != nil {
            let cmp = compare(e1: element, e2: node!.element)
            if cmp == 0 {return node}
            if cmp > 0 {
                node = node?.right
            }else{
                node = node?.left
            }
        }
        return nil
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

}
