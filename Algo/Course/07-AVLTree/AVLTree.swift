//
//  AVLTree.swift
//  Algo
//
//  Created by hong on 4/19/25.
//

import Foundation

class AVLTree<T: Comparable>: BST<T> {
    // 实现恢复平衡的逻辑
    override func afterAdd(node: BinaryTree<T>.Node<T>) {
        var node: (BinaryTree<T>.Node<T>)? = node
        while (node != nil) {
            if (isBlanced(node: node!)) {
                // 发现是平衡的，顺便更新节点的高度
                updateHeight(node: node!)
            } else {
                // 恢复平衡
                rebalance(grand: node!)
                break
            }
            node = node?.parent
        }
    }
    
    private func updateHeight(node: (BinaryTree<T>.Node<T>)?) {
        let avlNode: AVLNode<T>? = node as? AVLTree<T>.AVLNode<T>
        avlNode?.updateHeight()
    }
    
    override func createNode(element: T, parent: BinaryTree<T>.Node<T>?) -> BinaryTree<T>.Node<T> {
        return AVLNode<T>(element: element, parent: parent)
    }
    
    /// 【核心代码】
    /// - Parameter node: 高度最低的那个不平衡节点
    private func rebalance(grand: Node<T>) {
        let grand = grand as! AVLNode<T>
        let parent: AVLNode<T> = grand.tallerChild() as! AVLNode<T>
        let node: AVLNode<T> = parent.tallerChild() as! AVLNode<T>
        
        if parent.isLeftChild() {
            if node.isLeftChild() { // LL
                rotateRight(grand: grand)
            }else{ // LR
                rotateLeft(grand: parent)
                rotateRight(grand: grand)
            }
        } else { // R
            if node.isLeftChild() { // RL
                rotateRight(grand: parent)
                rotateLeft(grand: grand)
            }else{ // RR
                rotateLeft(grand: grand)
            }
        }
    }
    
    // 左旋转
    func rotateLeft(grand: Node<T>) {
        let parent = grand.right
        let child = parent?.left
        grand.right = child
        parent?.left = grand
        
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    // 右旋转
    func rotateRight(grand: Node<T>) {
        let parent = grand.left
        let child = parent?.right
        grand.left = child
        parent?.right = grand
        
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    private func afterRotate(grand: Node<T>, parent: Node<T>?, child: Node<T>?) {
        // 让parent称为子树的根节点
        parent?.parent = grand.parent
        if grand.isLeftChild() {
            grand.parent?.left = parent
        } else if (grand.isRightChild()) {
            grand.parent?.right = parent
        } else {
            root = parent
        }
        
        if let child = child {
            child.parent = grand
        }
        
        grand.parent = parent

        // 更新高度
        updateHeight(node: grand)
        updateHeight(node: parent)
    }
        
    private func isBlanced(node: BinaryTree<T>.Node<T>) -> Bool {
        abs((node as! AVLNode<T>).balanceFactor()) <= 1
    }
    
    private class AVLNode<E: Comparable>: BinaryTree<T>.Node<T> {
        
        var height: Int = 1
        
        override init(element: T, parent: BinaryTree<T>.Node<T>?) {
            super.init(element: element, parent: parent)
        }
        
        /// 平衡因子
        public func balanceFactor() -> Int {
            // 左子树的高度 - 右子树的高度
            let leftHeight = left == nil ? 0 : (left as! AVLNode<T>).height
            let rightHeight = right == nil ? 0 : (right as! AVLNode<T>).height
            
            return leftHeight - rightHeight
        }
        
        public func updateHeight() {
            let leftHeight = left == nil ? 0 : (left as! AVLNode<T>).height
            let rightHeight = right == nil ? 0 : (right as! AVLNode<T>).height
            height = 1 + max(leftHeight, rightHeight)
        }
        
        
        func tallerChild() -> Node<T>? {
            let leftHeight = left == nil ? 0 : (left as! AVLNode<T>).height
            let rightHeight = right == nil ? 0 : (right as! AVLNode<T>).height
            
            if (leftHeight > rightHeight) { return left }
            if (leftHeight < rightHeight) { return right }
            
            return isLeftChild() ? left : right
        }
    }
    
}
