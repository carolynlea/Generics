//: Playground - noun: a place where people can play

import Foundation


struct CountedSet<Element>: ExpressibleByArrayLiteral where Element: Hashable
{
    private var items = [Element: Int]()
    
    var count: Int = 0
    
    var isEmpty: Bool = true
    
    init(arrayLiteral: Element...)
    {
        for element in arrayLiteral
        {
            push(element)
        }
    }
    
    mutating func push(_ element: Element)
    {
        items[element] = count
        count += 1
        isEmpty = false
    }
    
    mutating func pop(_ element: Element) -> Int?
    {
        if items[element] != nil
        {
            let item = items[element]
            items[element] = nil
            count -= 1
            if count < 1
            {
                isEmpty = true
            }
            return item
        }
        return 0
    }
    
    mutating func contains(_ element: Element) -> Bool
    {
        return items.keys.contains(element)
    }
    
    subscript(_ member: Element) -> Int
    {
        get
        {
            return items[member] ?? 0
        }
    }
    
}



enum Arrow
{
    case iron
    case wooden
    case elven
    case dwarvish
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]

var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.pop(.iron) // 3
myCountedSet.pop(.dwarvish) // 0
myCountedSet.pop(.magic) // 0

//var storage = Dictionary<Element, Int>()








