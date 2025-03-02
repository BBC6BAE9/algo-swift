//
//  List.swift
//  Algo
//
//  Created by hong on 2/23/25.
//

import Foundation

let ELEMENT_NOT_FOUND = -1

/// List协议
protocol List {
    
    associatedtype E

    /// 清除所有的元素
    func clear()
    
    /// 元素的数量
    func size() -> Int
    
    /// 是否为空
    func isEmpty() -> Bool
     
    /// 是否包含某个元素
    func contains(element: E) -> Bool
    
    /// 添加某个元素
    func add(element: E)
    
    /// 获取某个元素
    func get(index: Int) -> E
    
    /// 设置index处的元素
    func set(index: Int, element: E) -> E
    
    /// 在index处添加一个元素
    func add(index: Int, element: E) -> Bool
    
    /// 删除index位置的元素
    func remove(index: Int) -> E
    
    /// 查看元素的索引
    func indexOf(element: E) -> Int
    
}
