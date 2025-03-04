//
//  Solution146Tests.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct Solution146Tests {
    
    @Test func testLRU() async throws {
        // 测试 LRUCache
        let lruCache = LRUCache(2)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        #expect(lruCache.get(1) == 1)
        lruCache.put(3, 3)
        #expect(lruCache.get(2) == -1)
    }
    
}
