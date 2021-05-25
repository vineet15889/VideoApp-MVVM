//
//  PlayerViewController.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {
    var playerViewModel:PlayerViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        if let playerModel = playerViewModel{
            playerViewModel?.vc = self
            playerModel.playCurrentData()
        }
    }
    
    func playVideo(url: URL) {
        self.player?.replaceCurrentItem(with: nil)
        self.player?.replaceCurrentItem(with: AVPlayerItem(url: url))
        self.player?.play()
    }
    
    func setupUI(){
        self.player = AVPlayer()
        self.showsPlaybackControls = false
        videoGravity = .resizeAspectFill
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.player?.replaceCurrentItem(with: nil)
    }
}
