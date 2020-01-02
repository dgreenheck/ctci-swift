import Cocoa

// MARK: - Summary

// 2.2 - Return K-th to Last
//
// Return the k-th to last item from a singly linked list.
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
// Space Complexity: O(1)

func returnKthToLast(_ root: Node, _ k: Int) -> Node {
    var index = 0
    var offsetNode = root
    var node = root
    while node.next != nil {
        node = node.next!
        if index >= k {
            offsetNode = offsetNode.next!
        }
        index += 1
    }
    return offsetNode
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
print(returnKthToLast(createLinkedListFromArray([1,2,3,4,5]),0).value)
print(returnKthToLast(createLinkedListFromArray([1,2,3,4,5]),2).value)
print(returnKthToLast(createLinkedListFromArray([1,2,3,4,5]),4).value)
print(returnKthToLast(createLinkedListFromArray([1]),0).value)

// MARK: - Output

//5
//3
//1
//1
