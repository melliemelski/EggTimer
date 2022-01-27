//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
  
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //stops ability to run more than one timer. If more than one running would execute code twice or more per second so timer  speeds up
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!

               Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                   #selector(updateTimer), userInfo: nil, repeats: true)
           }
           @objc func updateTimer() {
                if secondsPassed < totalTime {
                    
                    let percentageProgress = secondsPassed / totalTime
                    progressBar.progress = Float(percentageProgress)
                   secondsPassed += 1
                } else {
                    timer.invalidate()
                    titleLabel.text = "DONE!"
                    
                }
           }
}
