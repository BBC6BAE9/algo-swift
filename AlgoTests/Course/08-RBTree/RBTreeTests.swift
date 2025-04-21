//
//  RBTreeTests.swift
//  AlgoTests
//
//  Created by hong on 4/21/25.
//

import Testing

struct RBTreeTests {

    @Test func testRBTree() async throws {
        let data:[Int] = [55, 87, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50]
        
        let avl = RBTree<Int>()
        for item in data {
            avl.add(element: item)
        }
        
        print(avl.asString)
        
        let ret = avl.root

        let want = 7
//        assert(ret?.element == want)
    }

}
