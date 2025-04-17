//
//  Solution226Tests.swift
//  AlgoTests
//
//  Created by ihenryhuang on 2025/4/17.
//

import Testing

struct Solution226Tests {
    
    @Test func testInvertTree() async throws {
        let rootNode = TreeNode(1)
        rootNode.left = TreeNode(2)
        rootNode.right = TreeNode(3)
        let invertTreeNode = Solution226().invertTree(rootNode)
        
        let leftRet = invertTreeNode?.left?.val
        let leftWant = 3
        
        let rightRet = invertTreeNode?.right?.val
        let rightWant = 2
        
        assert(leftRet == leftWant)
        assert(rightRet == rightWant)
    }
}
