import Cocoa

// MARK: - Summary

// 1.6 - String Compression
//
// Performs simple compression on a string using the counts of repeated characters.
// Assume that strings are only composed of upper and lowercase letters. If the
// compressed string is longer than the original string, return the original string.
//
// Example: "aaabbcccccd" -> "a3b2c5d1"
// Example: "abcde"       -> "abcde"
//
// Author: Daniel Greenheck
// Date: MM/DD/YYYY
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Solution

// Time Complexity: O(N)
// Space Complexity: O(N)

func compressString(_ s: String) -> String {
    let compressedString = simpleCompression(s)
    return (compressedString.count < s.count) ? compressedString : s
}

func simpleCompression(_ s: String) -> String {
    var compressedString = ""
    // Reserve enough capacity ahead of time
    compressedString.reserveCapacity(s.count)
    
    var lastChar = Character(" ")
    var lastCharCount: Int = 0
    
    for c in s {
        guard c.isLetter else { continue }
        
        if c != lastChar {
            if lastCharCount > 0 {
                compressedString += "\(lastChar)\(lastCharCount)"
            }
            lastChar = c
            lastCharCount = 1
        }
        else {
            lastCharCount += 1
        }
    }
    if lastCharCount > 0 {
        compressedString += "\(lastChar)\(lastCharCount)"
    }
    
    return compressedString
}

// MARK: - Testing

print(compressString("aaabbcccccd"))
print(compressString("aabbccddee"))
print(compressString("aabbccddeee"))
print(compressString("abcd"))
print(compressString(""))

// MARK: - Output

//a3b2c5d1
//aabbccddee
//a2b2c2d2e3
//abcd
//
