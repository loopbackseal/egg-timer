//
//  ViewController.swift
//  egg-timer
//
//  Created by Young Soo Hwang on 2021/12/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTime = ["soft": 5, "medium": 7, "hard": 12]
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var counter: Int = 0
    var seconds = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        if let hardness = sender.currentTitle {
            counter = eggTime[hardness]! // * 60
            seconds = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        } else {
            print("title is nil")
        }
    }
    
    @objc func updateCounter() {
        if counter > seconds {
            seconds += 1
            progressBar.progress = Float(seconds)/Float(counter)
        } else {
            seconds = 0
            timer.invalidate()
            playSound()
            titleLabel.text = "DONE!"
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

