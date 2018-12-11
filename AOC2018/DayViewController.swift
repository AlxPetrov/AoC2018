//
//  DayViewController.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/1/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    var aocDay = 0
    
    var inputArray:[String] = []
    
    @IBOutlet weak var loading1: UIActivityIndicatorView!
    @IBOutlet weak var loading2: UIActivityIndicatorView!
    @IBOutlet weak var lblTime1: UILabel!
    @IBOutlet weak var lblTime2: UILabel!
    @IBOutlet weak var lblResult1: UILabel!
    @IBOutlet weak var lblResult2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let inputName = "Day\(aocDay)"
        inputArray = Helper.readInput(filename: inputName)
       // print("input loaded")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func StartPuzzle1(_ sender: Any) {
        loading1.startAnimating()
        lblTime1.text = "Executing"
        let startTime = Date.init()
        switch aocDay {
        case 1:
            DispatchQueue.global(qos: .background).async {
                            Day1.calculateFrequency(start: 0, frqArray: self.inputArray, completion: { (result) in
                                DispatchQueue.main.async {
                                    self.lblResult1.text = "\(result)"
                                    let endTime = Date.init()
                                    self.lblTime1.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                                    self.loading1.stopAnimating()
                                }
                            })
            }
        case 2:
            DispatchQueue.global(qos: .background).async {
                Day2.calculateCheckSum(input: self.inputArray, completion: { (result) in
                    DispatchQueue.main.async {
                        self.lblResult1.text = "\(result)"
                        let endTime = Date.init()
                        self.lblTime1.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                        self.loading1.stopAnimating()
                    }
                })
            }
        case 4:
            DispatchQueue.global(qos: .background).async {
                Day4.calculateTotalMinutesAsleep(input: self.inputArray, completion: { (dict) in
                    print(dict)
//                    DispatchQueue.main.async {
//                        self.lblResult1.text = "\(result)"
//                        let endTime = Date.init()
//                        self.lblTime1.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
//                        self.loading1.stopAnimating()
//                    }
                })
            }
        case 5:
//            Day5.reducePolymer(polymer: inputArray[0])
            print(Day5.reduceOne(polymer: inputArray[0]))
        case 6:
            DispatchQueue.global(qos: .background).async {
                Day6.findLargestArea(input: self.inputArray, completion: { (result) in
                    DispatchQueue.main.async {
                        self.lblResult1.text = "\(result)"
                        let endTime = Date.init()
                        self.lblTime1.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                        self.loading1.stopAnimating()
                    }
                })
            }
        default:
            break
        }
    }
    @IBAction func StartPuzzle2(_ sender: Any) {
        loading2.startAnimating()
        lblTime2.text = "Executing"
        let startTime = Date.init()
        switch aocDay {
        case 1:
            DispatchQueue.global(qos: .background).async {
                Day1.calculateFirstDoubleFrequency(start: 0, frqArray: self.inputArray) { (result) in
                    DispatchQueue.main.async {
                        self.lblResult2.text = "\(result)"
                        let endTime = Date.init()
                        self.lblTime2.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                        self.loading2.stopAnimating()
                    }
                }
            }
        case 2:
            DispatchQueue.global(qos: .background).async {
                Day2.findSimilarBoxIds(input: self.inputArray, completion: { (result) in
                    DispatchQueue.main.async {
                        self.lblResult2.text = "\(result)"
                        let endTime = Date.init()
                        self.lblTime2.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                        self.loading2.stopAnimating()
                    }
                })
            }
        case 5:
            Day5.removeThenReduce(polymer: inputArray[0])
        case 6:
            DispatchQueue.global(qos: .background).async {
                Day6.smallestDistance(input: self.inputArray, completion: { (result) in
                    DispatchQueue.main.async {
                        self.lblResult2.text = "\(result)"
                        let endTime = Date.init()
                        self.lblTime2.text = Helper.calculateExecutionTime(start: startTime, end: endTime)
                        self.loading2.stopAnimating()
                    }
                })
            }
        default:
            break
        }
    }
}
