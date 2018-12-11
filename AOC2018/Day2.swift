//
//  Day2.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/2/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Day2: NSObject {

    static func calculateCheckSum(input: [String], completion: (_ result:Int) -> Void) {
        var exactlyTwoCounter = 0
        var exactlyThreeCounter = 0
        for code in input {
            let charArray = Helper.getCodeCharatcers(code: code)
            let countedSet = NSCountedSet(array: charArray)
            var twoFound = false
            var threeFound = false
            for (_, value) in countedSet.dictionary {
                if value == 2 {
                    if !twoFound {
                        exactlyTwoCounter += 1
                        twoFound = true
                    }
                } else if value == 3 {
                    if !threeFound {
                        exactlyThreeCounter += 1
                        threeFound = true
                    }
                }
            }
        }
        completion(exactlyTwoCounter*exactlyThreeCounter)
    }
    static func findSimilarBoxIds(input: [String], completion: (_ result: String) -> Void) {
        for i in 0..<input.count-1 {
            for j in i+1..<input.count {
                let code1 = input[i]
                let code2 = input[j]
                let difference = zip(code1, code2).filter{ $0 != $1 }
                if difference.count == 1 {
                    let same = zip(code1, code2).filter{$0 == $1}
                    var common = ""
                    for element in same {
                        common.append(String(element.0))
                    }
                    completion(common)
                }
            }
        }
        
    }
}
extension NSCountedSet {
    var occurences: [(object: Any, count: Int)] {
        return allObjects.map { ($0, count(for: $0))}
    }
    var dictionary: [AnyHashable: Int] {
        return allObjects.reduce(into: [AnyHashable: Int](), {
            guard let key = $1 as? AnyHashable else { return }
            $0[key] = count(for: key)
        })
    }
}

