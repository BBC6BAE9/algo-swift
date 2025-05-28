//
//  BianryHeapTests.swift
//  AlgoTests
//
//  Created by hong on 5/28/25.
//

import Testing
import CoreFoundation

struct BianryHeapTests {

    @Test func testAdd() async throws {
        
        let heap = BinaryHeap<Int>()
        heap.add(element: 68)
        heap.add(element: 72)
        heap.add(element: 43)
        heap.add(element: 50)
        heap.add(element: 38)
        
        print("\(heap)")
    }

}
