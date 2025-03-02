//
//  LinkedListTests.swift
//  AlgoTests
//
//  Created by hong on 3/2/25.
//

import Testing

struct LinkedListTests {

    @Test func test() async throws {
        
        let list2 = LinkedList<Int>()
        list2.add(index: 0, element: 1)
        let ret = list2.size()
        let want = 1
        assert(ret == want)
        
        list2.clear()
        assert(list2.size() == 0)
        
    }

}
