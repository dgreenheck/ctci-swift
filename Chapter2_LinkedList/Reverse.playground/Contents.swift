import Cocoa

// MARK: - Summary

// Reverse
//
// Reverses a singly linked list.
//
// Author: Daniel Greenheck
//
// Date: 01/03/2020
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
// Space Complexity: O(1)

func reverse(_ root: Node) -> Node {
    var previous: Node? = nil
    var current: Node? = root
    var next: Node? = root
    while current != nil {
        next = current!.next
        current!.next = previous
        previous = current
        current = next
    }
    return previous!
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

// Test cases
printLinkedList(reverse(createLinkedListFromArray([1,2,3,4,5])))
printLinkedList(reverse(createLinkedListFromArray([1,2,3])))
printLinkedList(reverse(createLinkedListFromArray([1,2])))
printLinkedList(reverse(createLinkedListFromArray([1])))

// MARK: - Output

//5->4->3->2->1
//3->2->1
//2->1
//1
