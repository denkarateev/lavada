//
//  ProfileVideoViewController.swift
//  DatingApp
//
//  Created by user on 21.03.2022.
//

import UIKit
import AVFoundation
import MediaPlayer

class ProfileVideoViewController: UIViewController {
    var videoPlayerView: VideoPlayerView?
    var videoURL: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
       
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createAlertActionVideo()
    }
    func createAlertActionVideo() {
        let alert = UIAlertController(title: "Add video", message: "Add video", preferredStyle: .actionSheet)
        let recordAction = UIAlertAction(title: "Record", style: .default) { action in
            VideoService.instance.launchVideoRecorder(in: self, completion: nil)
        }
       
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
      
//
        subview.backgroundColor = #colorLiteral(red: 0, green: 0.06274509804, blue: 0.137254902, alpha: 1)
        alert.view.tintColor = UIColor.white
        
        let downlodAction = UIAlertAction(title: "Download", style: .default) { action in
            
        }
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(recordAction)
        alert.addAction(downlodAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

   

}
extension ProfileVideoViewController: VideoServiceDelegate {
    func videoDidFinishSaving(error: Error?, url: URL?) {
          let success: Bool = error == nil && url != nil
        if success {
                   playMovie(with: url!)
                    self.videoURL = url
               }
          let title = success ? "Success" : "Error"
          let message = success ? "Video was saved" : "Could not save video"
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    
    
}
extension ProfileVideoViewController {
    private func playMovie(with url: URL) {
        let playerRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width / 2)
        videoPlayerView = VideoPlayerView(withFrame: playerRect, videoURLString: url.path)
        view.addSubview(videoPlayerView!)
    }
}
