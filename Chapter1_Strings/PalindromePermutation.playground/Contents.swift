import Cocoa

// MARK: - Summary

// 1.4 - Palindrome Permutation
//
// Given a string, write a function to check if it is a permutaiton of a palindrome.
// A palindrome is a word or phrase that is the same forwards and backwards. A
// permutation is a rearrangement of letters. The palindrome does not need to be limited
// to just dictionary words.
//
// Author: Daniel Greenheck
//
// Date: 12/31/2019
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Solution

// Time Complexity: O(N)
// Space Complexity: O(N)

// Returns true if the string is a permutation of a palindrome
func palindromePermutation(_ s: String) -> Bool {
    let f = buildFrequencyTable(s)
    return hasOnlyOneOddElement(f)
}

// Builds the frequency table of character counts from the given string
func buildFrequencyTable(_ s: String) -> [Int] {
    var f = [Int](repeating: 0, count: Int(UInt8.max))
    
    for c in s {
        // Only count characters
        guard c.isLetter else { continue }
        
        if let asciiValue = c.asciiValue {
            f[Int(asciiValue)] += 1
        }
    }
    return f
}

// Returns true if the array has only one odd element
func hasOnlyOneOddElement(_ f: [Int]) -> Bool {
    var onlyOneOddElement = false
    for count in f {
        // Check if count is even
        if count % 2 == 0 {
            continue
        }
        // If already found an odd count, array has more than one odd count
        else if onlyOneOddElement == true {
            return false
        }
        else {
            onlyOneOddElement = true
        }
    }
    return true
}

// MARK: - Testing

func testPermutation(_ s: String) {
    let result = palindromePermutation(s)
    print("Checking if \(s) is a permutation of a palindrome... \(result)")
}

testPermutation("taco cat") // Expect true
testPermutation("barbed wire") // Expect false
testPermutation("") // Expect true
testPermutation(" ") // Expect true
testPermutation("aa") // Expect true
testPermutation("aba") // Expect true
testPermutation("abca") // Expect false

// MARK: - Output

//Checking if taco cat is a permutation of a palindrome... true
//Checking if barbed wire is a permutation of a palindrome... false
//Checking if  is a permutation of a palindrome... true
//Checking if   is a permutation of a palindrome... true
//Checking if aa is a permutation of a palindrome... true
//Checking if aba is a permutation of a palindrome... true
//Checking if abca is a permutation of a palindrome... false

