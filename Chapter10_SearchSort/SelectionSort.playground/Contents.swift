import Cocoa

// Name: SelectionSort.swift
//
// Description: Selection sort is an in-place sorting algorithm.
// The algorithm sweeps through the entire array and finds the
// smallest item, placing it at the beginning of the array. This
// is repeated for each subset of the array until the last element
// is reached.
//
// Time Complexity: O(N^2)
// Space Complexity: O(1)
//
// Author: Daniel Greenheck

func selectionSort(_ array: inout [Int]) {
    // Need at least two elements to sort
    guard array.count > 1 else { return }
    
    // Pass through the array n-1 times
    let n = array.count
    for i in 0..<(n-1) {
        // Find minimum within subset [i,n-1]
        var min = Int.max
        var k = 0
        for j in i..<n {
            if array[j] < min {
                min = array[j]
                k = j
            }
        }
        // Swap elements
        let temp = array[i]
        array[i] = min
        array[k] = temp
    }
}

// MARK: - Test

func testSelectionSort(_ array: [Int]) {
    var array = array
    selectionSort(&array)
    print(array)
}

testSelectionSort([]) //
testSelectionSort([1]) // 1
testSelectionSort([1,2]) // 1,2
testSelectionSort([2,1]) // 1,2
testSelectionSort([1,1,1,1,1]) // 1,1,1,1,1
testSelectionSort([1,3,2,5,2]) // 1,2,2,3,5
testSelectionSort([1,2,3,4,5]) // 1,2,3,4,5
testSelectionSort([5,4,3,2,1]) // 1,2,3,4,5
testSelectionSort([4,3,5,2,1]) // 1,2,3,4,5
