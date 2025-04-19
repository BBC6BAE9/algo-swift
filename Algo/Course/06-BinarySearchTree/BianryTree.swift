//
//  BianryTree.swift
//  Algo
//
//  Created by hong on 4/19/25.
//

import Foundation

class BianryTree<T: Comparable>  {
    
    public var size: Int = 0
    
    var root: Node<T>?
    
    func getRoot() -> Any? {
        return root
    }
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func clear(){
        root = nil
        size = 0
    }
    
    /// 前序遍历【递归】
    /// 根结点、前序遍历左子树、前序遍历右子树
    func preorderTraversal() {
        preorderTraversal(node: root)
    }
    
    private func preorderTraversal(node: Node<T>?) {
        guard let node = node else {
            return
        }
        print(node.element)
        preorderTraversal(node: node.left)
        preorderTraversal(node: node.right)
    }
    
    /// 中序遍历
    /// 中序遍历左子树、根结点、中序遍历右子树
    func inorderTraversal() {
        inorderTraversal(node: root)
    }
    
    private func inorderTraversal(node: Node<T>?) {
        guard let node = node else {
            return
        }
        inorderTraversal(node: node.left)
        print(node.element)
        inorderTraversal(node: node.right)
    }
    
    /// 中序遍历
    /// 中序遍历左子树、中序遍历右子树、根结点
    func postorderTraversal() {
        postorderTraversal(node: root)
    }
    
    private func postorderTraversal(node: Node<T>?) {
        guard let node = node else {
            return
        }
        postorderTraversal(node: node.left)
        postorderTraversal(node: node.right)
        print(node.element)
    }
    
    /// 层序遍历
    func levelOrderTravrtsal() {
        guard let root = root else {
            return
        }
        let queue = Queue<Node<T>>()
        queue.enQueue(element: root)
        
        while !queue.isEmpty() {
            let node = queue.deQueue()!
            print(node.element)
            
            if let leftNode = node.left {
                queue.enQueue(element: leftNode)
            }
            
            if let rightNode = node.right {
                queue.enQueue(element: rightNode)
            }
        }
    }
    
    // 【迭代】二叉树的高度
    func height() -> Int {
        guard let root = root else {
            return 0
        }
        
        var height = 0
        
        var levelSize = 1
        
        let queue = Queue<Node<T>>()
        queue.enQueue(element: root)
        
        while !queue.isEmpty() {
            let node = queue.deQueue()!
            levelSize -= 1
            if let leftNode = node.left {
                queue.enQueue(element: leftNode)
            }
            
            if let rightNode = node.right {
                queue.enQueue(element: rightNode)
            }
            
            if levelSize == 0 { // 意味着即将要访问下一层
                levelSize = queue.size()
                height += 1
            }
        }
        
        return height
    }
    
    /// 【递归】二叉树的高度
    func height2() -> Int {
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
    
    class Node<E: Comparable>: Equatable {
        static func == (lhs: BST<T>.Node<E>, rhs: BST<T>.Node<E>) -> Bool {
            lhs.element == rhs.element
        }
        
        var element: E
        var left: Node<E>?
        var right: Node<E>?
        var parent: Node<E>?
        
        init(element: E, parent: Node<E>?) {
            self.element = element
            self.parent = parent
        }
        
        /// 是否是叶子节点
        func isLeaf() -> Bool {
            return left == nil && right == nil
        }
        
        /// 是否有两个子节点
        func hasTwoChildren() -> Bool {
            return left != nil && right != nil
        }
        
    }
}
