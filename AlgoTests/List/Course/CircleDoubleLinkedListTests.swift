//
//  CircleDoubleLinkedListTests.swift
//  AlgoTests
//
//  Created by hong on 3/3/25.
//

import Testing

struct CircleDoubleLinkedListTests {

    @Test func testCircleLinkedList() async throws {
        
        let list = CircleLinkedList<Int>()
        list.add(element: 11) // [11]
        list.add(element: 22) // [11, 22]
        list.add(element: 33) // [11, 22, 33]
        list.add(element: 44) // [11, 22, 33, 44]
        list.add(index: 0, element: 55) // [55, 11, 22, 33, 44]
        list.add(index: 2, element: 66) // [55, 11, 66, 22, 33, 44]
        list.add(index: list.size(), element: 77) // [55, 11, 66, 22, 33, 44, 77]
        let _ = list.remove(index: 0) // [11, 66, 22, 33, 44, 77]
        let _ = list.remove(index: 2) // [11, 66, 33, 44, 77]
        let _ = list.remove(index: list.size() - 1) // [11, 66, 33, 44]
        
        assert(list.size() == 4)
        assert(list.get(index: 0) == 11)
        assert(list.get(index: 1) == 66)
        assert(list.get(index: 2 ) == 33)
        assert(list.get(index: 3) == 44)
    }

    @Test func testCircleLinkedList1() async throws {
        
        let list = CircleLinkedList<Int>()
        list.add(element: 11) // [11]
        let _ = list.remove(index: 0) // [11, 66, 22, 33, 44, 77]
        
        assert(list.size() == 0)
    }
}
