//
//  BubbleSortTests.swift
//  AlgoTests
//
//  Created by hong on 5/20/25.
//

import Testing

struct BubbleSortTests {

    @Test func testBubbleSort() async throws {
        
        let input = [10, 9, 29, 28, 37, 56, 34]
        
        let ret = bubbleSort(array: input)
        
        let want = [9, 10, 28, 29, 34, 37, 56]

        assert(ret == want)
    }

}
