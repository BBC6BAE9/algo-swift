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
    
    public func remove(element: T) {
        remove(node: node(element: element))
    }
    
    private func removeElement(element: T) {
        remove(node: node(element: element))
    }
    
    private func contains(element: T) -> Bool {
        return false
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

// 前驱节点（predecessor）中序遍历时的前一个节点

extension BinarySearchTree {
    
    // 获取一个节点的前驱节点
    private func predecessor(node: Node<T>?) -> Node<T>? {
        var node = node
        if node == nil {
            return nil
        }
        
        // 前驱节点在左子树中（left.right.right.right...）
        if let leftNode = node?.left {
            var p: Node<T>? = leftNode
            while (p?.right != nil){
                p = p?.right
            }
            return p
        }
        
        // 从父节点、祖父节点中寻找前驱节点
        while(node?.parent != nil && node == node?.parent?.left){
            node = node?.parent
        }
        
        return node?.parent
    }
    
    // 获取一个节点的后继节点
    private func successor(node: Node<T>?) -> Node<T>? {
        var node = node
        if node == nil {
            return nil
        }
        
        // 前驱节点在左子树中（right.left.left.left...）
        if let leftNode = node?.right {
            var p: Node<T>? = leftNode
            while (p?.right != nil){
                p = p?.left
            }
            return p
        }
        
        // 从父节点、祖父节点中寻找前驱节点
        while(node?.parent != nil && node == node?.parent?.right){
            node = node?.parent
        }
        
        return node?.parent
    }
}

