//
//  VideoViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 12/04/22.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let path = Bundle.main.path(forResource: "adukDanCampur", ofType: "MOV")!
        let url = URL(fileURLWithPath: path)
        let player = AVPlayer(url: url)
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = contentView.frame
        layer.videoGravity = .resizeAspectFill
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = layer.frame

        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.videoGravity = .resizeAspectFill
    }

}
