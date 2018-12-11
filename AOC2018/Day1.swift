//
//  Day1.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/1/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Day1: NSObject {

    static func calculateFrequency(start:Int, frqArray:[String], completion:(_ result: Int) -> Void) {
        var i = start
        for frq in frqArray {
            let intFrq = Int(frq)
            i += intFrq!
        }
        completion(i)
    }
    static func calculateFirstDoubleFrequency(start:Int, frqArray:[String], completion:(_ result:Int) -> Void) {
        var i = start
        var firstDuplicate = i
        var doubleFound = false
        var allFRQ:[Int] = [i]
        while !doubleFound {
            for frq in frqArray {
                let intFrq = Int(frq)
                i += intFrq!
                if allFRQ.contains(i) {
                    firstDuplicate = i
                    doubleFound = true
                    break
                } else {
                    allFRQ.append(i)
                }
            }
        }
        completion(firstDuplicate)
    }
}
