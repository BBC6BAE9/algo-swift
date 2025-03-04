//
//  Solution14Tests.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct Solution14Tests {

    @Test func testLongestCommonPrefix() async throws {
        let strs = ["flower","flow","flight"]
        let ret = Solution14().longestCommonPrefix(strs)
        let want = "fl"
        #expect(ret == want)    
    }

}
