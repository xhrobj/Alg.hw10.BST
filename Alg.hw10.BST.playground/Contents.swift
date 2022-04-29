import Foundation

var bst = Tree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

var needle = 1

example(of: "Поиск значения \"\(needle)\":") {
    print(bst.contains(needle) ? "Найдено" : "Не найдено")
}

needle = 10

example(of: "Поиск значения \"\(needle)\":") {
    print(bst.contains(needle) ? "Найдено" : "Не найдено")
}

example(of: "Удаление значения \"1\":") {
    bst.remove(1)
    print(bst)
}

example(of: "Добавление значений \"7\" и \"6\":") {
    bst.insert(7)
    print(bst)
    bst.insert(6)
    print(bst)
}

let treeCapacity = 500, count = treeCapacity / 10

example(of: "Дерево из \"случайных элементов\"") {
    let timestamp = Date()
    print("1. Добавим \(treeCapacity) случайных элементов в пустое дерево")
    var randomBST = Tree<Int>(), insertedNumbers = Set<Int>()
    while insertedNumbers.count < treeCapacity {
        let x = Int.random(in: 1...(treeCapacity * 100))
        guard !insertedNumbers.contains(x) else { continue }
        randomBST.insert(x)
        insertedNumbers.insert(x)
    }

    print("2. Поиск \(count) случайных (но существующих) элементов в дереве")
    let shuffledNumbers = Array(Array(insertedNumbers)[..<count]).shuffled()
    for x in shuffledNumbers {
        randomBST.contains(x)
    }

    print("3. Удаление \(count) случайных элементов в дереве")
    for x in shuffledNumbers {
        randomBST.remove(x)
    }

    print("time:", Date().timeIntervalSince(timestamp))
}

example(of: "Дерево из \"последовательных элементов\"") {
    let timestamp = Date()
    print("1. Добавим \(treeCapacity) элементов (от 1 до \(treeCapacity)) в пустое дерево")
    var consistentBST = Tree<Int>()
    for x in 1...treeCapacity {
        consistentBST.insert(x)
    }
    
    print("2. Поиск \(count) случайных (но существующих) элементов в дереве")
    let shuffledNumbers = Array(Array(1...treeCapacity).shuffled()[..<count])
    for x in shuffledNumbers {
        consistentBST.contains(x)
    }

    print("3. Удаление \(count) случайных элементов в дереве")
    for x in shuffledNumbers {
        consistentBST.remove(x)
    }

    print("time:", Date().timeIntervalSince(timestamp))
}
