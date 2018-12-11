//
//  ViewController.swift
//  AOC2018
//
//  Created by Aleksandar Petrov on 12/1/18.
//  Copyright © 2018 ALX. All rights reserved.
//

import UIKit

class AOCViewController: UIViewController {

    
    var numberOfAOCDaysSolved = 6
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDayResults" {
            if let vc:DayViewController = segue.destination as? DayViewController {
                vc.aocDay = (tableView.indexPathForSelectedRow!.row + 1)
            }
        }
    }

}
extension AOCViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfAOCDaysSolved
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "aocDayCell", for: indexPath)
        cell.textLabel?.text = "AOC day \(indexPath.row + 1)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDayResults", sender: self)
    }
}
