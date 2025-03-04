//
//  Solution14.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // 边界检查
        if strs.isEmpty { return "" }
        if strs.count == 1 { return strs[0] }
        
        // 以第一个字符串为基准
        let firstStr = strs[0]
        var commonPrefix = ""
        
        // 遍历第一个字符串的每个字符
        for (i, char) in firstStr.enumerated() {
            // 检查其他字符串是否匹配当前字符
            for str in strs[1...] {
                // 如果当前字符串的长度不够，或者字符不匹配，则返回当前结果
                if i >= str.count || str[str.index(str.startIndex, offsetBy: i)] != char {
                    return commonPrefix
                }
            }
            // 如果所有字符串都匹配当前字符，则添加到公共前缀
            commonPrefix.append(char)
        }
        
        return commonPrefix
    }
}
