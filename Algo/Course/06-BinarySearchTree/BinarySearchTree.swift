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
        
    func getRoot() -> Any? {
        return root
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
    
    class Node<E: Comparable>: Equatable {
        static func == (lhs: BinarySearchTree<T>.Node<E>, rhs: BinarySearchTree<T>.Node<E>) -> Bool {
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

extension BinarySearchTree {
    /// 判断是否是 完全二叉树
    /// 定义：叶子结点只能出现在最下层和次下层，且最下层的叶子结点集中在树的左部
    func isComplete() -> Bool {
        
        // 空树认为不是完全二叉树
        guard let root = root else {
            return false
        }
        
        // 非空树
        let queue = Queue<Node<T>>()
        queue.enQueue(element: root)
        
        var needLeaf = false
        
        while !queue.isEmpty() {
            let node = queue.deQueue()!
            
            if needLeaf && !node.isLeaf() {
                return false
            }
            
            if let leftNode = node.left {
                queue.enQueue(element: leftNode)
            } else if node.right != nil {
                return false
            }
            
            if let rightNode = node.right {
                queue.enQueue(element: rightNode)
            } else {
                needLeaf = true
            }
        }
        
        return true
    }
}
