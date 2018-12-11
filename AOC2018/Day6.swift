//
//  Day6.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/6/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class Day6: NSObject {

    struct coord {
        let x:Int
        let y:Int
        let id:Int
    }
    static func smallestDistance(input: [String], completion:(_ result: Int) -> Void) {
        var coordArray: [coord] = []
        for i in 0..<input.count {
            let coords = input[i].components(separatedBy: ", ")
            let x = Int(coords[0])
            let y = Int(coords[1])
            let newCoord = coord(x: x!, y: y!, id: i+1)
            coordArray.append(newCoord)
        }
        let matrix: Matrix = Matrix.init(rows: 1000, columns: 1000)
        var total = 0
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                let point = coord(x: j, y: i, id: 0)
                let sum = sumOfDistances(point: point, array: coordArray)
                if sum < 10000 {
                    //matrix[i,j] = 1
                    total += 1
                }
            }
        }
        completion(total)
    }
    static func findLargestArea(input: [String], completion:(_ result: Int) -> Void) {
        var coordArray: [coord] = []
        for i in 0..<input.count {
            let coords = input[i].components(separatedBy: ", ")
            let x = Int(coords[0])
            let y = Int(coords[1])
            let newCoord = coord(x: x!, y: y!, id: i+1)
            coordArray.append(newCoord)
        }
        let matrix: Matrix = Matrix.init(rows: 1000, columns: 1000)
        var dict: [String: Int] = [:]
        for i in 0..<matrix.rows {
            for j in 0..<matrix.columns {
                let closest = shortestDistance(point: coord(x: j, y: i, id: 0), array: coordArray)
                if closest != nil {
                    matrix[i,j] = (closest?.id)!
                    var sum: Int = (dict["\(closest!.id)"] != nil) ? dict["\(closest!.id)"]! : 0
                    sum += 1
                    dict["\(closest!.id)"] = sum
                }
            }
        }
        let values = Array(dict.values.sorted().reversed())
        var maxArea = 0
        for item in values {
            let key = Int(dict.allKeys(forValue: item)[0])
            let coordinate = coordArray[key! - 1]
            if isDefinite(coordinate: coordinate, matrix: matrix) {
                maxArea = dict["\(coordinate.id)"]!
                break
            }
        }
        completion(maxArea)
    }
    static func isDefinite(coordinate: coord, matrix: Matrix) -> Bool {
        var definiteRight = false
        var definiteLeft = false
        var definiteUp = false
        var definiteDown = false
        for i in coordinate.x..<matrix.columns {
            if matrix[coordinate.y,i] != coordinate.id {
                definiteRight = true
                break
            }
        }
        for i in stride(from: coordinate.x, to: 0, by: -1) {
            if matrix[coordinate.y,i] != coordinate.id {
                definiteLeft = true
                break
            }
        }
        for i in coordinate.y..<matrix.rows {
            if matrix[i,coordinate.x] != coordinate.id {
                definiteDown = true
                break
            }
        }
        for i in stride(from: coordinate.y, to: 0, by: -1) {
            if matrix[i,coordinate.x] != coordinate.id {
                definiteUp = true
                break
            }
        }
        if definiteUp && definiteDown && definiteLeft && definiteRight {
            return true
        } else {
            return false
        }
    }
    static func manhattanDistance(from: coord, to: coord) -> Int {
        return (abs(from.x - to.x) + abs(from.y - to.y))
    }
    static func shortestDistance(point:coord, array: [coord]) -> coord? {
        var min = 1000
        var closest: coord?
        var duplicatedistance = false
        for item in array {
            let distance = manhattanDistance(from: point, to: item)
            if distance == 0 {
                return coord(x: item.x, y: item.y, id: item.id)
            }else {
                if distance < min {
                    min = distance
                    closest = item
                    duplicatedistance = false
                } else if distance == min {
                    duplicatedistance = true
                }
            }
        }
        if duplicatedistance {
            return nil
        }
        return closest
    }
    static func sumOfDistances(point:coord, array:[coord]) -> Int {
        var sum = 0
        for item in array {
            sum += manhattanDistance(from: point, to: item)
        }
        return sum
    }
}
class Matrix: CustomStringConvertible {
    var description: String {
        var dsc = ""
        for row in 0..<rows {
            for col in 0..<columns {
                let s = String(self[row,col])
                dsc += s + " "
            }
            dsc += "\n"
        }
        return dsc
    }
    
    internal var data:Array<Int>
    
    var rows: Int
    var columns: Int
    
    init(_ data:Array<Int>, rows:Int, columns:Int) {
        self.data = data
        self.rows = rows
        self.columns = columns
    }
    
    init(rows:Int, columns:Int) {
        self.data = [Int](repeating: 0, count: rows*columns)
        self.rows = rows
        self.columns = columns
    }
    subscript(row: Int, col: Int) -> Int {
        get {
            return data[(row * columns) + col]
        }
        
        set {
            self.data[(row * columns) + col] = newValue
        }
    }
}
