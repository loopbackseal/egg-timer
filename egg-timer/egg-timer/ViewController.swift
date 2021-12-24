//
//  ViewController.swift
//  egg-timer
//
//  Created by Young Soo Hwang on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {

    let hardnessTime = ["soft": 5, "medium": 7, "hard": 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func eggPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print(hardnessTime[hardness]!)
    }
    
}

