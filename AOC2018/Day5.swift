//
//  Day5.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/5/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Day5: NSObject {
    
    static func reducePolymer(polymer: String) -> Int {
        var reductionMade = true
        var tempPolymer = polymer
        while reductionMade {
            reductionMade = false
            var lastIndex = 0
            for i in lastIndex..<tempPolymer.count-1 {
                let index1 = tempPolymer.index(tempPolymer.startIndex, offsetBy: i)
                let index2 = tempPolymer.index(tempPolymer.startIndex, offsetBy: i+1)
                let typeLeft = String(tempPolymer[index1])
                let typeRight = String(tempPolymer[index2])
                if typeLeft.caseInsensitiveCompare(typeRight) == .orderedSame {
                    if typeLeft != typeRight {
                        tempPolymer.remove(at: index2)
                        tempPolymer.remove(at: index1)
                        reductionMade = true
                        lastIndex = tempPolymer.distance(from: tempPolymer.startIndex, to: index1) - 1
                        if lastIndex < 0 {
                            lastIndex = 0
                        }
                        print("current length: \(tempPolymer.count) starting index: \(lastIndex)")
                        break
                    }
                }
            }
        }
        return tempPolymer.count
    }
    static func removeThenReduce(polymer: String) -> Void {
        let distinctTypes = Set(polymer.lowercased())
        for type in distinctTypes {
            var tempPolymer = polymer.replacingOccurrences(of: String(type), with: "")
            tempPolymer = tempPolymer.replacingOccurrences(of: String(type).uppercased(), with: "")
            let reducedsize = reduceOne(polymer: tempPolymer)
            print("reduced size: \(reducedsize)")
        }
    }
    static func reduceOne(polymer:String) -> Int {
        var polymerIntArray: [Int] = []
        for i in 0..<polymer.count {
            polymerIntArray.append(polymer[i].asciiValue)
        }
        var result = polymer.count;
        
        var findex = 0;
        var sindex = 1;
        
        let len = polymer.count;
        
        while (sindex < len) {
            let fchar = polymerIntArray[findex]
            let schar = polymerIntArray[sindex]

            if (abs(fchar - schar) == 32) {
                polymerIntArray[findex] = 0
                polymerIntArray[sindex] = 0
                result -= 2
                sindex += 1
                while (polymerIntArray[findex] == 0) {
                    if findex != 0 {
                        findex -= 1
                    } else {
                        break
                    }
                }
            } else {
                findex = sindex
                sindex += 1
            }
        }
        return result;
    }
}
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}
