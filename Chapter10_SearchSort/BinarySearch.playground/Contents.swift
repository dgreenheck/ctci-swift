import Cocoa

// Name: Binary Search
//
// Description: Performs binary search on a sorted array.
// Returns the index of the element with the value x if
// it exists, otherwise -1
//
// Author: Daniel Greenheck
//
// Date: 01/05/2020

func binarySearch(_ arr: [Int], _ x: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = (low + high) / 2
        // If middle value is less than target value,
        // change search area to upper sub-array
        if arr[mid] < x {
            low = mid + 1
        }
        // If middle value is greater than target value,
        // change search area to lower sub-array
        else if arr[mid] > x {
            high = mid - 1
        }
        else {
            return mid
        }
    }
    
    return -1
}

print(binarySearch([],1))
print(binarySearch([1],1))
print(binarySearch([1],0))
print(binarySearch([1,2,3], 2))
print(binarySearch([0,2,5,6,9,12,49],12))
