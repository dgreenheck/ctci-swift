import Cocoa

// MARK: - Summary

// 2.3 - Remove Middle Node
//
// Remove a node in the middle of a singly linked list (i.e. not
// the first or last node) given only access to that node
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

// Time Complexity: O(1)
// Space Complexity: O(1)

func removeMiddleNode(_ node: Node) {
    // Algorithm does not work if last node
    guard node.next != nil else { return }
    
    if let next = node.next {
        node.value = next.value
        node.next = next.next
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

func testRemoveMiddleNode(_ values: [Int], _ offset: Int) {
    // Create a linked list from the array of values
    let root = createLinkedListFromArray(values)
    
    // Get a reference to the node to remove
    var nodeToRemove = root
    for _ in 0..<offset {
        if let next = nodeToRemove.next {
            nodeToRemove = next
        }
    }
    
    print("Before Removal: ", terminator: "")
    printLinkedList(root)
    
    removeMiddleNode(nodeToRemove)
    
    print("After Removal: ", terminator: "")
    printLinkedList(root)
    
    print("")
}

// Test cases
testRemoveMiddleNode([1,2,3,4,5],2)
testRemoveMiddleNode([1,2,3,4,5],3)
testRemoveMiddleNode([1,2,3],1)
testRemoveMiddleNode([1],0)
testRemoveMiddleNode([1,2],1)

// MARK: - Output

//Before Removal: 1->2->3->4->5
//After Removal: 1->2->4->5
//
//Before Removal: 1->2->3->4->5
//After Removal: 1->2->3->5
//
//Before Removal: 1->2->3
//After Removal: 1->3
//
//Before Removal: 1
//After Removal: 1
//
//Before Removal: 1->2
//After Removal: 1->2
