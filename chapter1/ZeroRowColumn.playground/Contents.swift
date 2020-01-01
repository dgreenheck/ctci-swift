import Cocoa

// MARK: - Summary

// 1.8 - Zero Matrix
//
// Write an algorithm such taht if an element in an MxN matrix is 0, its entire row and
// column are set to zero
//
// Author: Daniel Greenheck
//
// Date: 01/01/2020
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Solution

// Time Complexity: O(N^2)
// Space Complexity: O(N+M)

func zeroMatrix(_ M: inout [[Int]]) {
    guard M.count > 0 else { return }
    
    // These arrays keep track of which elements get set to zero
    var zeroRow = [Bool](repeating: false, count: M.count)
    var zeroCol = [Bool](repeating: false, count: M[0].count)
    // Iterate through all elements first to find zeros
    for i in 0..<M.count {
        let row = M[i]
        for j in 0..<row.count {
            if row[j] == 0 {
                zeroRow[i] = true
                zeroCol[j] = true
            }
        }
    }
    // Set rows and columns to zero
    for i in 0..<M.count {
        let row = M[i]
        for j in 0..<row.count {
            if zeroRow[i] || zeroCol[j] {
                M[i][j] = 0
            }
        }
    }
}

func printMatrix(_ M: [[Int]]) {
    for i in 0..<M.count {
        let row = M[i]
        for j in 0..<row.count {
            print(M[i][j], terminator: "")
            if j < row.count-1 {
                print(",", terminator: "")
            }
        }
        print("")
    }
}

func testZeroMatrix(_ M: [[Int]]) {
    var M = M
    
    print("Original Matrix")
    printMatrix(M)
    
    // Zero out rows and columns for elements that are zero
    zeroMatrix(&M)
  
    print("Zeroed Matrix")
    printMatrix(M)
    print(" ")
}

// MARK: - Testing

testZeroMatrix([[1,1,1,1],[1,1,1,1],[1,1,1,1]])
testZeroMatrix([[1,1,1,1],[1,0,1,1],[1,1,1,1]])
testZeroMatrix([[0,1,1,1],[1,0,1,1],[1,1,0,1]])
testZeroMatrix([[0,0,0,0],[0,0,0,0],[0,0,0,0]])

// MARK: - Output

//Original Matrix
//1,1,1,1
//1,1,1,1
//1,1,1,1
//Zeroed Matrix
//1,1,1,1
//1,1,1,1
//1,1,1,1
//
//Original Matrix
//1,1,1,1
//1,0,1,1
//1,1,1,1
//Zeroed Matrix
//1,0,1,1
//0,0,0,0
//1,0,1,1
//
//Original Matrix
//0,1,1,1
//1,0,1,1
//1,1,0,1
//Zeroed Matrix
//0,0,0,0
//0,0,0,0
//0,0,0,0
//
//Original Matrix
//0,0,0,0
//0,0,0,0
//0,0,0,0
//Zeroed Matrix
//0,0,0,0
//0,0,0,0
//0,0,0,0
//
