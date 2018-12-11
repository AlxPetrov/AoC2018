//
//  Helper.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/1/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Helper: NSObject {

    static func readInput(filename:String) -> [String] {
        var result: [String] = []
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                result = myStrings
            } catch {
                print(error)
            }
        }
        return result
    }
    static func calculateExecutionTime(start: Date, end: Date) -> String {
        let interval = end.timeIntervalSince(start)
        if interval < 1 {
            return String(format: "%.2f miliseconds", interval*1000)
        } else if interval > 1 && interval < 60 {
            return String(format: "%.1f seconds", interval)
        } else {
            let minutes = interval/60
            let seconds = interval.truncatingRemainder(dividingBy: 60)
            return String(format: "%d min and %d sec", minutes, seconds)
        }
    }
    static func getCodeCharatcers(code:String) -> [String] {
        var chararray:[String] = []
        
        for c in code {
            chararray.append(String(c))
        }
        return chararray
    }
//    static func numberOfDifferences(code1: String, code2: String) -> Int {
//        var dif = 0
//        let difference = zip(x, y).filter{ $0 != $1 }
//    }
}
