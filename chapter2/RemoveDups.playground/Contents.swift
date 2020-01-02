import Cocoa

// MARK: - Summary

// 1.8 - Remove Dups
//
// Removes duplicates from an unsorted linked list
//
// Author: Daniel Greenheck
//
// Date: 01/01/2020
//
// Source: Laakmann-McDowell, Gayle. Cracking the Coding Interview. 2015. 6th ed.

// MARK: - Given

// Linked list node
class Node {
    var next: Node?
    var value: Int
    
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}

// MARK: - Solution

// Time Complexity: O(N)
// Space Complexity: O(N)

func removeDups(_ root: Node) {
    var node: Node = root
    var existingValues = Set<Int>([root.value])
    var previousNode = node
    while node.next != nil {
        node = node.next!
        if existingValues.contains(node.value) {
            if let nextNode = node.next {
                previousNode.next = nextNode
            }
            else {
                previousNode.next = nil
            }
        }
        else {
            existingValues.insert(node.value)
            previousNode = node
        }
    }
}

// MARK: - Testing

func printLinkedList(_ root: Node) {
    print(root.value, terminator: "")
    var node = root
    while node.next != nil {
        node = node.next!
        print("->", terminator: "")
        print(node.value, terminator: "")
    }
    print("")
}

func createLinkedListFromArray(_ values: [Int]) -> Node {
    guard values.count > 0 else { return Node(0) }
    
    let root = Node(values[0])
    var node = root
    for i in 1..<values.count {
        let nextNode = Node(values[i])
        node.next = nextNode
        node = nextNode
    }
    return root
}

func testRemoveDups(_ values: [Int]) {
    let root = createLinkedListFromArray(values)
    removeDups(root)
    printLinkedList(root)
}

// Test cases
testRemoveDups([1,2,3,4,5])
testRemoveDups([1,2,2,3,4])
testRemoveDups([1,2,3,2,5])
testRemoveDups([1,2,3,2,1])
testRemoveDups([1,1,1,1,1])
testRemoveDups([1])

// MARK: - Output

//1->2->3->4->5
//1->2->3->4
//1->2->3->5
//1->2->3
//1
//1
