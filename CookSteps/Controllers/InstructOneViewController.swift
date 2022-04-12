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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        caraMemasakContainer.layer.cornerRadius = 8
        detailInstruksiContainer.layer.cornerRadius = 8
        pengingatContainer.layer.cornerRadius = 8
        hasilContainer.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let path = Bundle.main.path(forResource: "adukDanCampur", ofType: "MOV")!
        let url = URL(fileURLWithPath: path)
        let player = AVPlayer(url: url)
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
        playerViewController.didMove(toParent: self)
    }

}
