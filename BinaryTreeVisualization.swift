import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class BinaryTreeVisualizer {
    static func createTree() -> TreeNode {
        // Create nodes
        let root = TreeNode(7)
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node8 = TreeNode(8)
        let node9 = TreeNode(9)
        let node11 = TreeNode(11)
        
        // Build the tree structure
        root.left = node4
        root.right = node9
        
        node4.left = node2
        node4.right = node5
        
        node9.left = node8
        node9.right = node11
        
        return root
    }
    
    static func printTree(_ root: TreeNode?, level: Int = 0, prefix: String = "Root: ") {
        guard let node = root else { return }
        
        // Print current node
        let indent = String(repeating: "    ", count: level)
        print(indent + prefix + "\(node.val)")
        
        // Print left subtree with "L─" prefix
        printTree(node.left, level: level + 1, prefix: "L─")
        
        // Print right subtree with "R─" prefix
        printTree(node.right, level: level + 1, prefix: "R─")
    }
}

// Create and visualize the tree
let tree = BinaryTreeVisualizer.createTree()
print("Binary Tree Structure:")
BinaryTreeVisualizer.printTree(tree) 