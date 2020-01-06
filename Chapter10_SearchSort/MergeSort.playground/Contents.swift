import Cocoa

// Name: MergeSort.swift
//
// Description: Merge sort is a divide & conquer approach.
// The array is divided in half and each half is sorted
// then merged back together. Each half has the sorting
// algorithm applied to it.
//
// Time Complexity: O(n*log(n))
// Space Complexity: O(n)
//
// Author: Daniel Greenheck

func mergeSort(_ array: inout [Int]) {
    // If less than 2 elements, nothing to sort
    guard array.count > 1 else { return }
    
    var helper: [Int] = [Int](repeating: 0, count: array.count)
    mergeSort(&array, &helper, 0, array.count - 1)
}

func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        let middle = (low + high) / 2
        mergeSort(&array, &helper, low, middle)     // Sort left half
        mergeSort(&array, &helper, middle+1, high)  // Sort right half
        merge(&array, &helper, low, middle, high)   // Merge halves
    }
}

func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
    // Copy halves into the helper array
    for i in low...high {
        helper[i] = array[i]
    }
    
    var helperLeft = low
    var helperRight = middle + 1
    var current = low
    
    // Iterate through the helper array, comparing the left and right halves
    // Copy the smaller element from the two halves into the original array
    while (helperLeft <= middle) && (helperRight <= high) {
        if helper[helperLeft] <= helper[helperRight] {
            array[current] = helper[helperLeft]
            helperLeft += 1
        }
        else {
            array[current] = helper[helperRight]
            helperRight += 1
        }
        current += 1
    }
    
    // Copy the rest of the left side of the array into the target array
    if middle >= helperLeft {
        let remaining = middle - helperLeft
        for i in 0...remaining {
            array[current + i] = helper[helperLeft + i]
        }
    }
}

// MARK: - Test

func testMergeSort(_ array: [Int]) {
    var array = array
    mergeSort(&array)
    print(array)
}

testMergeSort([])           //
testMergeSort([1])          // 1
testMergeSort([1,2])        // 1,2
testMergeSort([2,1])        // 1,2
testMergeSort([1,1,1,1,1])  // 1,1,1,1,1
testMergeSort([1,3,2,5,2])  // 1,2,2,3,5
testMergeSort([1,2,3,4,5])  // 1,2,3,4,5
testMergeSort([5,4,3,2,1])  // 1,2,3,4,5
testMergeSort([4,3,5,2,1])  // 1,2,3,4,5
