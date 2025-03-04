//
//  FixedSizeArrayTests.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct FixedSizeArrayTests {

    @Test func test() async throws {
        let arr = FixedSizeArray<Int>()
        arr[0] = 1
        
        #expect(arr[0] == 1)
    }

}
