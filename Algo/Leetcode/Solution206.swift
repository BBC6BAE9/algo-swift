//
//  Solution206.swift
//  Algo
//
//  Created by hong on 3/3/25.
//

import Foundation

// 206 https://leetcode.cn/problems/reverse-linked-list/description/
// 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

class Solution206 {
    /// 用本地的代码 LinkedList.Node 进行调试一下
    func reverseList1(_ head: LinkedList<Int>.Node<Int>?) -> LinkedList<Int>.Node<Int>? {
        var head = head
        // 处理【head指针为空】的情况和【链表没有的元素】的情况
        if (head == nil) {
            return nil
        }
        
        if head?.next == nil {
            return nil
        }
        
        var newhead: LinkedList<Int>.Node<Int>?
        
        while head != nil {
            let tmp = head?.next
            head?.next = newhead
            newhead = head
            head = tmp
        }
        
        return newhead
    }
    
    /// 用本地的代码 LinkedList.Node 进行调试一下
    func reverseList2(_ head: LinkedList<Int>.Node<Int>?) -> LinkedList<Int>.Node<Int>? {
        var head = head
        // 处理【head指针为空】的情况和【链表没有的元素】的情况
        if (head == nil) {
            return nil
        }
        
        if head?.next == nil {
            return nil
        }
        
        var newhead: LinkedList<Int>.Node<Int>?
        
        while head != nil {
            let tmp = head?.next
            head?.next = newhead
            newhead = head
            head = tmp
        }
        
        return newhead
    }
}
