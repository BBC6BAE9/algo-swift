//
//  AVLTree.swift
//  AlgoTests
//
//  Created by hong on 4/19/25.
//

import Testing

struct AVLTreeTests { 

    @Test func testAVL() async throws {
        let data:[Int] = [85, 19, 69, 3, 7, 99, 95, 2, 1, 70, 44, 58, 11, 21, 14, 93, 57, 4, 56]
        let avl = AVLTree<Int>()
        for item in data {
            avl.add(element: item)
        }
        let ret = avl.root
        let want = 19
        print(avl.asString)
        assert(ret?.element == want)
    }

}
