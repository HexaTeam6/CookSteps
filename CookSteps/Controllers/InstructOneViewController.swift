//
//  InstructOneViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 12/04/22.
//

import UIKit
import AVKit
import AVFoundation

class InstructOneViewController: UIViewController {
    @IBOutlet weak var caraMemasakContainer: UIView!
    @IBOutlet weak var detailInstruksiContainer: UIView!
    @IBOutlet weak var pengingatContainer: UIView!
    @IBOutlet weak var hasilContainer: UIView!
    @IBOutlet weak var videoContainer: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mulaiButton: UIButton!
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var timerIsDone: Bool = false
    
    var player: AVPlayer = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        caraMemasakContainer.layer.cornerRadius = 8
        detailInstruksiContainer.layer.cornerRadius = 8
        pengingatContainer.layer.cornerRadius = 8
        hasilContainer.layer.cornerRadius = 8
        
        count = stringToSeconds(formatedText: timeLabel.text!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initVideoPlayer(path: "memasakAir", type: "MOV")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        player.pause()
    }
    
    // MARK: - Video Player
    func initVideoPlayer(path: String, type: String) {
        let resPath = Bundle.main.path(forResource: path, ofType: type)!
        let url = URL(fileURLWithPath: resPath)
        player = AVPlayer(url: url)
        let layer = AVPlayerLayer(player: player)
        
        player.rate = 1
        
        layer.frame = videoContainer.frame
        layer.videoGravity = .resizeAspectFill
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = layer.frame

        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.videoGravity = .resizeAspectFill
    }
    
    // MARK: - Timer

    @IBAction func startStopTapped(_ sender: UIButton) {
        if timerIsDone { return }
        
        if timerCounting {
            timerCounting = false
            timer.invalidate()
            mulaiButton.setTitle("Mulai", for: .normal)
        }
        else {
            timerCounting = true
            mulaiButton.setTitle("Jeda", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        count -= 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeLabel.text = timeString
        
        if count == 0 {
            timer.invalidate()
            timerIsDone = true
            mulaiButton.setTitle("Selesai", for: .normal)
        }
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600)/60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
//        timeString += String(format: "%02d", hours)
//        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        
        return timeString
    }
    
    func stringToSeconds(formatedText: String) -> Int {
        let arrayText = formatedText.components(separatedBy: ":")
        let minutes = Int(arrayText[0])
        let seconds = Int(arrayText[1])
        
        return (seconds ?? 0) + ((minutes ?? 0) * 60)
    }
}
