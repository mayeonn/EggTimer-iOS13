//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var seconds = 60
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle! //느낌표: sender에 currentTitle이 nil인 경우는 없음을 확인함
        print(eggTimes[hardness]!)  //느낌표: hardness로 eggTimes dictionary를 탐색했을 때 nil인 경우는 없음을 확인함
        seconds = eggTimes[hardness]!*60
        countDownTimer()
    }
    
    @objc func countDownTimer(){
        var secondsRemaining = self.seconds
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
            self.progressBar.progress = Float(secondsRemaining)/Float(self.seconds)
            
            if secondsRemaining < 1{
                self.titleLabel.text = "Done!"
                self.timer.invalidate()
            }
            
        }
    }
}
