//
//  Solution226.swift
//  Algo
//
//  Created by ihenryhuang on 2025/4/17.
//

import Foundation
// 226 翻转二叉树 https://leetcode.cn/problems/invert-binary-tree/description/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return root
        }
        
        let tmpNode = root.left
        root.left = root.right
        root.right = tmpNode
        
        _ = invertTree(root.left)
        _ = invertTree(root.left)
        return root
    }
}
