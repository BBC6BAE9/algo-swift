//
//  Solution146.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

// LRU （Least Recently Used的缩写）
// 1 2 4 5 7
// 1、哈希表
// 2、双向链表，在O(1)的时间内进行插入和删除
class LRUCache {
    
    
    private var head: LRUNode
    private var tail: LRUNode
    
    private var h: [Int: LRUNode] = [:]
    
    private var capacity: Int
    
    private var size: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head = LRUNode(key: 0, value: 0)
        tail = LRUNode(key: 0, value: 0)
        head.next = tail
        tail.prev = head
    }
    
    // 获取缓存中的值
    func get(_ key: Int) -> Int {
        if let node = h[key] {
            moveToHead(node) // 移动到链表头部
            return node.value
        }
        return -1
    }
    
    // 插入或更新缓存
    func put(_ key: Int, _ value: Int) {
        if let node = h[key] {
            node.value = value // 更新值
            moveToHead(node) // 移动到链表头部
        } else {
            let newNode = LRUNode(key: key, value: value)
            h[key] = newNode
            addToHead(newNode) // 添加到链表头部
            if h.count > capacity {
                if let removedNode = removeTail() {
                    h.removeValue(forKey: removedNode.key) // 移除最久未使用的节点
                }
            }
        }
    }
    
    // MARK: Private
    // 将节点移动到链表头部
    private func moveToHead(_ node: LRUNode) {
        removeNode(node)
        addToHead(node)
    }
    
    // 添加节点到链表头部
    private func addToHead(_ node: LRUNode) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    // 移除链表中的节点
    private func removeNode(_ node: LRUNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // 移除链表尾部的节点（最久未使用的节点）
    private func removeTail() -> LRUNode? {
        if let tailNode = tail.prev, tailNode !== head {
            removeNode(tailNode)
            return tailNode
        }
        return nil
    }
}

// 定义双向链表的节点
class LRUNode {
    var key: Int
    var value: Int
    var prev: LRUNode?
    var next: LRUNode?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}
