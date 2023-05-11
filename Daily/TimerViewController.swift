//
//  TimerViewController.swift
//  Daily
//
//  Created by Cherish Spikes on 5/8/23.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerInputField: UITextField!
    
    
    
    var timer: Timer?
    var timeRemaining: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let timeText = timerInputField.text, let time = TimeInterval(timeText) else {
            return
        }
        if time > 0 {
            timeRemaining = time
            startTimer()
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timeRemaining = 0
        updateTimerLabel()
    }
    
    func startTimer() {
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeRemaining -= 1
        updateTimerLabel()
        if timeRemaining == 0 {
            timer?.invalidate()
        }
    }
    
    func updateTimerLabel(){
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        timerLabel.text = String(format: "#02d:%02d", minutes, seconds)
    }
    @objc func fireTimer() {
        print("Timer fired!")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
