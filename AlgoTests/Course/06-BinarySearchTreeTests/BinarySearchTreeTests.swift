//
//  BinarySearchTreeTests.swift
//  AlgoTests
//
//  Created by hong on 4/16/25.
//

import Testing

struct BinarySearchTreeTests {

    @Test func test() async throws {
        let data:[Int] = [7, 4, 9, 2, 5, 8, 11, 3]
        let bst = BinarySearchTree<Int>()
        for item in data {
            bst.add(element: item)
        }
        let ret = bst.root?.left?.left?.right?.element
        let want = 3
        assert(ret == want)
    }

}
