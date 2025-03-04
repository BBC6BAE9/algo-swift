//
//  Solution206Tests.swift
//  AlgoTests
//
//  Created by hong on 3/4/25.
//

import Testing

struct Solution206Tests {

    @Test func testReverseList1() async throws {
        
        let linkedList = LinkedList<Int>()
        
        linkedList.add(element: 1)
        linkedList.add(element: 2)
        linkedList.add(element: 3)
        linkedList.add(element: 4)
        linkedList.add(element: 5)
        linkedList.add(element: 6)
        
        let head = linkedList.head
        
        #expect(head?.element == 1)
        #expect(head?.next?.element == 2)
        #expect(head?.next?.next?.element == 3)
        #expect(head?.next?.next?.next?.element == 4)
        #expect(head?.next?.next?.next?.next?.element == 5)
        #expect(head?.next?.next?.next?.next?.next?.element == 6)
        #expect(head?.next?.next?.next?.next?.next?.next == nil)
        
        let reverseList = Solution206().reverseList1(linkedList.head)
        
        #expect(reverseList?.element == 6)
        #expect(reverseList?.next?.element == 5)
        #expect(reverseList?.next?.next?.element == 4)
        #expect(reverseList?.next?.next?.next?.element == 3)
        #expect(reverseList?.next?.next?.next?.next?.element == 2)
        #expect(reverseList?.next?.next?.next?.next?.next?.element == 1)
        #expect(reverseList?.next?.next?.next?.next?.next?.next == nil)

    }
    
    @Test func testReverseList2() async throws {
        
        let linkedList = LinkedList<Int>()
        
        linkedList.add(element: 1)
        linkedList.add(element: 2)
        linkedList.add(element: 3)
        linkedList.add(element: 4)
        linkedList.add(element: 5)
        linkedList.add(element: 6)
        
        let head = linkedList.head
        
        #expect(head?.element == 1)
        #expect(head?.next?.element == 2)
        #expect(head?.next?.next?.element == 3)
        #expect(head?.next?.next?.next?.element == 4)
        #expect(head?.next?.next?.next?.next?.element == 5)
        #expect(head?.next?.next?.next?.next?.next?.element == 6)
        #expect(head?.next?.next?.next?.next?.next?.next == nil)
        
        let reverseList = Solution206().reverseList2(linkedList.head)
        
        #expect(reverseList?.element == 6)
        #expect(reverseList?.next?.element == 5)
        #expect(reverseList?.next?.next?.element == 4)
        #expect(reverseList?.next?.next?.next?.element == 3)
        #expect(reverseList?.next?.next?.next?.next?.element == 2)
        #expect(reverseList?.next?.next?.next?.next?.next?.element == 1)
        #expect(reverseList?.next?.next?.next?.next?.next?.next == nil)

    }

}
