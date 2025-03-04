//
//  Solution88Tests.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct Solution88Tests {

    @Test func testMerge() async throws {
        var input1 = [1, 3, 5, 0, 0, 0]
        
        Solution88().merge(&input1, 3, [2,4,6], 3)
        
        #expect(input1 == [1, 2, 3, 4, 5, 6])
    }

}
