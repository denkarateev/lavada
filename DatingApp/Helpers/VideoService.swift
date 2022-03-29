//
//  VideoService.swift
//  DatingApp
//
//  Created by user on 20.03.2022.
//

import Foundation
import MobileCoreServices
import UIKit
protocol VideoServiceDelegate {
    func videoDidFinishSaving(error: Error?, url: URL?)
}

class VideoService: NSObject {
    var delegate: VideoServiceDelegate?
    static let instance = VideoService()
    private override init() {}
    
}
extension VideoService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("VideoService: entered didFinishPickingMediaWithInfo")
            guard let mediaURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL else { return }
            self.saveVideo(at: mediaURL)
    }
    private func isVideoRecordingAvailable() -> Bool {
        
        let front = UIImagePickerController.isCameraDeviceAvailable(.front)
        let rear = UIImagePickerController.isCameraDeviceAvailable(.rear)
        if !front || !rear {
            return false
        }
        guard let media = UIImagePickerController.availableMediaTypes(for: .camera) else {
            return false
        }
        return media.contains(kUTTypeMovie as String)
    }
    
    private func setupVideoRecordingPicker() -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.videoQuality = .typeMedium
        picker.delegate = self
        picker.mediaTypes = [kUTTypeMovie as String]
        return picker
    }
    
    func launchVideoRecorder(in vc: UIViewController, completion: (() -> ())?) {
        guard isVideoRecordingAvailable() else {
            return }

        let picker = setupVideoRecordingPicker()

        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            vc.present(picker, animated: true) {
                completion?()
            }
        }
    }
    
}
extension VideoService {

    private func saveVideo(at mediaUrl: URL) {
        let compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaUrl.path)
        if compatible {
            UISaveVideoAtPathToSavedPhotosAlbum(mediaUrl.path, self, #selector(video(videoPath:didFinishSavingWithError:contextInfo:)), nil)
            
        }
    }

    @objc func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        let videoURL = URL(fileURLWithPath: videoPath as String)
        self.delegate?.videoDidFinishSaving(error: error, url: videoURL)
    }
}
