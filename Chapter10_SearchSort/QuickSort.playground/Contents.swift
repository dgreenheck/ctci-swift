import Cocoa

// Name: QuickSort.swift
//
// Description: Quick sorts begins by choosing a random element and
// partitioning the  array, such that all numbers that are less
// than the partioning element come before all elements greater than it.
//
// Time Complexity: Average - O(n*log(n)), Worst case O(n^2)
// Space Complexity: O(n)
//
// Author: Daniel Greenheck

func quickSort(_ array: inout [Int]) {
    // If less than 2 elements, nothing to sort
    guard array.count > 1 else { return }
    quickSort(&array, 0, array.count - 1)
}

func quickSort(_ array: inout [Int], _ left: Int, _ right: Int) {
    let index = partition(&array, left, right)
    // Sort left half
    if left < (index - 1) {
        quickSort(&array, left, index - 1)
    }
    if index < right {
        quickSort(&array, index, right)
    }
}

func partition(_ array: inout[Int], _ left: Int, _ right: Int) -> Int {
    // Redeclare arguments as mutable variables
    var left = left
    var right = right
    
    // Pick pivot in the middle
    let pivot = array[(left + right) / 2]
    while left <= right {
        // Find element on left that should be on right
        while array[left] < pivot {
            left += 1
        }
        // Find element on right that should be on left
        while array[right] > pivot {
            right -= 1
        }
        
        // Swap elements and move left and right indices
        if left <= right {
            array.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    return left
}

// MARK: - Test

func testQuickSort(_ array: [Int]) {
    var array = array
    quickSort(&array)
    print(array)
}

testQuickSort([])           //
testQuickSort([1])          // 1
testQuickSort([1,2])        // 1,2
testQuickSort([2,1])        // 1,2
testQuickSort([1,1,1,1,1])  // 1,1,1,1,1
testQuickSort([1,3,2,5,2])  // 1,2,2,3,5
testQuickSort([1,2,3,4,5])  // 1,2,3,4,5
testQuickSort([5,4,3,2,1])  // 1,2,3,4,5
testQuickSort([4,3,5,2,1])  // 1,2,3,4,5
