//
//  ViewController.swift
//  egg-timer
//
//  Created by Young Soo Hwang on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {

    let eggTime = ["soft": 5, "medium": 7, "hard": 12]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var counter: Int = 0
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        }
    }
    
    @IBAction func eggPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        counter = eggTime[hardness]! * 60
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
}

