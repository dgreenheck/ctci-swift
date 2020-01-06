import Cocoa

// Name: BubbleSort.swift
//
// Description: Bubble sort is an in-place sorting algorithm.
// The algorithm starts at the beginning of the array
// and swaps the first two elements if the first is greater than
// the second. Then the next pair of elements is compared. The
// array is continually swept and modified in this manner until
// the array is sorted.
//
// Time Complexity: O(N^2)
// Space Complexity: O(1)
//
// Author: Daniel Greenheck

func bubbleSort(_ array: inout [Int]) {
    // Need at least two elements to sort
    guard array.count > 1 else { return }
    
    // Continue sorting until no swaps occur
    var swapped = true
    while swapped {
        swapped = false
        for i in 0..<(array.count-1) {
            if array[i] > array[i+1] {
                let temp = array[i]
                array[i] = array[i+1]
                array[i+1] = temp
                swapped = true
            }
        }
    }
}

// MARK: - Test

func testBubbleSort(_ array: [Int]) {
    var array = array
    bubbleSort(&array)
    print(array)
}

testBubbleSort([])
testBubbleSort([1])
testBubbleSort([1,2])
testBubbleSort([2,1])
testBubbleSort([1,1,1,1,1])
testBubbleSort([1,3,2,5,2])
testBubbleSort([1,2,3,4,5])
testBubbleSort([5,4,3,2,1])
testBubbleSort([4,3,5,2,1])
