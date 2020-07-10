//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes = ["Soft": 180, "Medium": 360, "Hard": 480]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
       
    let hardness = sender.currentTitle!
    totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        label.text = hardness
        
        
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        if self.secondsPassed < self.totalTime {
            self.secondsPassed += 1
            self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
            
            self.label.text = "\((self.totalTime+1) - self.secondsPassed)"

           
        } else {
            Timer.invalidate()
            self.label.text = "DONE!"
            self.playSound(soundName: "alarm_sound")
        }
       
        }
       
    


}
    func playSound(soundName: String) {
           let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
                   
       }
}
