//
//  Solution3.swift
//  Algo
//
//  Created by hong on 3/4/25.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        return 0
//        // 将字符串转换为字符数组，方便索引访问
//        let characters = Array(s)
//        var charSet = Set<Character>()
//        var maxLength = 0
//        var left = 0
//        
//        for right in 0..<characters.count {
//            let currentChar = characters[right]
//            
//            // 如果当前字符已经在集合中，移动左指针
//            while charSet.contains(currentChar) {
//                charSet.remove(characters[left])
//                left += 1
//            }
//            
//            // 将当前字符添加到集合中
//            charSet.insert(currentChar)
//            
//            // 更新最大长度
//            maxLength = max(maxLength, right - left + 1)
//        }
//        
//        return maxLength
    }
    
    
    func lengthOfLongestSubstringDIY(_ s: String) -> Int {
        return 0
//        let characterArr = Array(s)
//        var left = 0
//        var maxL = 0
//        
//        // right指针往右走
//        for right in 0..<characterArr.count {
//            let currentChar = characterArr[right]
//            
//            
//        }
//        
//        return maxL
    }
}
