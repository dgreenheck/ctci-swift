import Cocoa

// MARK: - Summary

// 1.1 - Is Unique
//
// Determine if a string has all unique characters
//
// Author: Daniel Greenheck
//
// Date: 12/31/2019
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Solution

// Time Complexity: O(N)
// Space Complexity: O(N)

func isUnique(_ s: String) -> Bool {
    var chars = Set<Character>()
    
    for c in s {
        if chars.contains(c) {
            return false
        }
        else {
            chars.insert(c)
        }
    }
    
    return true
}

// MARK: - Testing

print(isUnique(""))
print(isUnique("abcdefghijklmnopqrstuvwxyz"))
print(isUnique("abcdefghijklmnopqrstuvwxyza"))
