public struct Tree<Element: Comparable> {
    public private(set) var root: Node<Element>?

    public init() {}

    public func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }

    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    public mutating func remove(_ value: Element) {
      root = remove(node: root, value: value)
    }
}

extension Tree {
    private func insert(from node: Node<Element>?, value: Element) -> Node<Element> {
        guard let node = node else {
            return Node(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
  
    private func remove(node: Node<Element>?, value: Element) -> Node<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

extension Tree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "пустое 🌳 дерево" }
        return String(describing: root)
    }
}

private extension Node {
    var min: Node {
        leftChild?.min ?? self
    }
}
