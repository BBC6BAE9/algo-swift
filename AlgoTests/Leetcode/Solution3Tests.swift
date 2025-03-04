//
//  Test.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct Solution3Tests {

    @Test func testLengthOfLongestSubstring1() async throws {
        let ret = Solution3().lengthOfLongestSubstring("abcabcbb")
        let want = 3
        #expect(ret == want)
    }
    
    
    
    @Test func testLengthOfLongestSubstring2() async throws {
        let ret = Solution3().lengthOfLongestSubstring("bbbbb")
        let want = 1
        #expect(ret == want)
    }
    
    
    @Test func testLengthOfLongestSubstring3() async throws {
        let ret = Solution3().lengthOfLongestSubstring("pwwkew")
        let want = 3
        #expect(ret == want)
    }

}
