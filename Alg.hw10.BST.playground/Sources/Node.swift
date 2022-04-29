public class Node<Element> {
    public var value: Element
    public var leftChild: Node?
    public var rightChild: Node?

    public init(value: Element) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        draw(for: self)
    }

    private func draw(for node: Node?, _ top: String = "", _ root: String = "", _ bottom: String = "" ) -> String {
        guard let node = node else { return root + "x\n" }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }

        return draw(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + draw(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
