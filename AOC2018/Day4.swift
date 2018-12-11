//
//  Day4.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/4/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Day4: NSObject {

    static func calculateTotalMinutesAsleep(input: [String], completion: (_ result: [String: [String]]) -> Void) {
        let sortedInput = input.sorted(by: <)
        var guardId:String = ""
        var asleep = false
        var asleepminute:Int?
        var guardsSleepRoutine: [String: [String]] = [:]
        
        var minutesDict: [String: [String]] = [:]
        
        for item in sortedInput {
            if let gid = item.slice(from: "Guard #", to: " begins") {
                guardId = gid
            }
            if let asleeptime = item.slice(from: ":", to: "] falls") {
                asleep = true
                asleepminute = Int(asleeptime)
            }
            if let wakesTime = item.slice(from: ":", to: "] wakes") {
                if asleep {
                    var sleepHistory:[String] = []
                    if guardsSleepRoutine[guardId] != nil {
                        sleepHistory = guardsSleepRoutine[guardId]!
                    }
                    for i in asleepminute!..<Int(wakesTime)! {
                        let minute = String(format: "%02d", i)
                        sleepHistory.append(minute)
                        var mins: [String] = []
                        if minutesDict[minute] != nil {
                            mins = minutesDict[minute]!
                        }
                        mins.append(guardId)
                        minutesDict[minute] = mins
                    }
                    guardsSleepRoutine[guardId] = sleepHistory
                    asleep = false
                }
            }
            //print(item.slice(from: "[", to: " "))
        }
        let spanko = calculateMostMinutesAsleep(sleepDict: guardsSleepRoutine)
        let key:String = Array(spanko.keys)[0]
        let sleepMinutes = spanko[key]
        let counts = sleepMinutes!.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
        let minuteKeys = Array(minutesDict.keys)
        for key in minuteKeys {
            let guardsasleep = minutesDict[key]
            let countguardsasleep = guardsasleep!.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
            let maxspanko = countguardsasleep.values.max()!
            let maxspankokey = countguardsasleep.allKeys(forValue: maxspanko)[0]
            print("minute: \(key) spanko: \(maxspankokey) : \(maxspanko)")
        }
        completion([key: sleepMinutes!])
    }
    static func calculateMostMinutesAsleep(sleepDict: [String: [String]]) -> [String: [String]] {
        var sleepArray = Array(sleepDict.values)
        var max = sleepArray[0]
        for i in 1..<sleepArray.count {
            if sleepArray[i].count > max.count {
                max = sleepArray[i]
            }
        }
        let keys = sleepDict.allKeys(forValue: max)
        return [keys[0] : max]
    }
}
extension String {
    
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}
