import Cocoa

// MARK: - Summary

// 1.5 - One Edit Away
//
// Given two strings s1 & s2, determine if the strings can be made
// equivalent by performing one and only one of the following three
// operations on one of the strings.
//
//   Insert: Insert a character into a string
//   Removal: Remove a character from a string
//   Replace: Replace a character in a string
//
// Examples:
//  s1 = "abc", s2 = "aac"  -> TRUE (replace 2nd character of s2 with 'b')
//  s1 = "ab" , s2 = "abc"  -> TRUE (append 'c' to s1)
//  s1 = "abc", s2 = "abcd" -> TRUE (remove 'd' from s2)
//  s1 = "abc", s2 = "cba"  -> FALSE (two replace operations required)
//  s1 = ""   , s2 = ""     -> TRUE (identical empty strings)
//  s1 = "abc", s2 = "abc"  -> TRUE (identical strings)
//
// Author: Daniel Greenheck
//
// Date: 12/31/2019
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Solution

// The operations can be treated as two separate cases.
//  1. If strings are of identical length, then a replace operation must be used since insert or removed would modifiy the length of the strings.
//  2. If the length of the strings differs by 1, then an insert or remove operation can be used. Both insert and remove are effectively the same operation, since you can always insert a character into the shorter string.

// Time Complexity: O(N)
// Space Complexity: O(1)

func oneEditAway(_ s1: String, _ s2: String) -> Bool {
    if s1.count == s2.count {
        return oneEditReplace(Array(s1), Array(s2))
    }
    else if (s1.count + 1 == s2.count) {
        return oneEditInsert(Array(s1), Array(s2))
    }
    else if (s1.count - 1 == s2.count) {
        return oneEditInsert(Array(s2), Array(s1))
    }
    return false
}

func oneEditReplace(_ s1: [Character], _ s2: [Character]) -> Bool {
    var mismatchFound = false
    for i in 0..<s1.count {
        if s1[i] != s2[i] {
            if mismatchFound {
                return false
            }
            else {
                mismatchFound = true
            }
        }
    }
    return true
}

func oneEditInsert(_ s1: [Character], _ s2: [Character]) -> Bool {
    var index1 = 0
    var index2 = 0
    while (index1 < s1.count && index2 < s2.count) {
        if s1[index1] != s2[index2] {
            if index1 != index2 {
                return false
            }
            index2 += 1
        }
        else {
            index1 += 1
            index2 += 1
        }
    }
    return true
}

// MARK: - Testing

print(oneEditAway("abc", "aac"))
print(oneEditAway("ab", "abc"))
print(oneEditAway("abc", "abcd"))
print(oneEditAway("abc", "cba"))
print(oneEditAway("", ""))
print(oneEditAway("abc", "abc"))

// MARK: - Output

//true
//true
//true
//false
//true
//true
