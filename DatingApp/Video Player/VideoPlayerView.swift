//
//  VideoPlayerView.swift
//  DatingApp
//
//  Created by user on 21.03.2022.
//

import Foundation
import UIKit
import AVFoundation
class VideoPlayerView: UIView {
    private var isSettingPlay = true
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?

    init(withFrame frame: CGRect, videoURLString: String) {
        super.init(frame: frame)
        
        setupVideoPlayer(with: videoURLString)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setupVideoPlayer(with path: String) {
        addPlayer(with: path)
        player?.play()
    }
    
    private func addPlayer(with urlPath: String) {
        let videoURL = URL(fileURLWithPath: urlPath)
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        
        self.layer.addSublayer(playerLayer!)
        playerLayer?.frame = self.bounds
    }
    @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
           if isSettingPlay {
               player?.pause()
           } else {
               player?.play()
           }
           isSettingPlay = !isSettingPlay
       }
}
