import Foundation

extension Array {
    func take(_ n: Int) -> [Element] {
        if self.count == 0 {
            return []
        }
        let size = self.count < n ? self.count : n
        var result: [Element] = []
        for index in 0...size-1 {
            result.append(self[index])
        }
        return result
    }
    
    func each(_ f: (Element) -> ()) {
        for item in self {
            f(item)
        }
    }
    
    func eachWithIndex(_ f: (Int, Element) -> ()) {
        if self.count <= 0 {
            return
        }
        for i in 0...self.count-1 {
            f(i, self[i])
        }
    }

    func zip<U>(_ other: [U]) -> [(Element, U)] {
        var result = [(Element, U)]()
        for (p, q) in Swift.zip(self, other) {
            result.append((p, q))
        }
        return result
    }

    func indexOf <U: Equatable> (_ item: U) -> Int? {
        if item is Element {
            return unsafeBitCast(self, to: [U].self).indexOf(item)
        }
        
        return nil
    }
    
    func find (_ f: (Element) -> Bool) -> Element? {
        for value in self {
            if f(value) {
                return value
            }
        }
        return nil
    }
    
    func mapWithIndex<U>(_ f: (Int, Element) -> U) -> [U] {
        if self.isEmpty {
            return []
        }
        var elements: [U] = []
        for i in 0...self.count-1 {
            let item = self[i]
            let newItem = f(i, item)
            elements.append(newItem)
        }
        return elements
    }
    
    func without<U: Equatable>(_ target: U) -> [U] {
        var results: [U] = []
        for item in self {
            if item as! U != target {
                results.append(item as! U)
            }
        }
        return results
    }
    
    func at(_ index: Int) -> Element? {
        if count > index {
            return self[index]
        }
        return nil
    }
    
    func flatten<U>() -> [U] {
        var res: [U] = []
        for array in self {
            if let arr = array as? [U] {
                for item in arr {
                    res.append(item)
                }
            }
        }
        return res
    }
    
}
