//
//  VideoImageView.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit
import AVKit
let imageCache = NSCache<NSString, AnyObject>()
class VideoImageView: UIImageView {
    var videoUrl:String?
    func imageFormVideoUrl(urlStr:String){
        image = nil
        videoUrl = urlStr
        if let imageFromCache = imageCache.object(forKey: urlStr as NSString) as? UIImage{
            self.image = imageFromCache
            return
        }
        DispatchQueue.global().async {
            guard let url = URL(string: urlStr) else{return}
            let asset = AVAsset(url: url)
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            avAssetImageGenerator.appliesPreferredTrackTransform = true
            let thumnailTime = CMTimeMake(value: 2, timescale: 10)
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
                DispatchQueue.main.async {
                    let imageForCache = UIImage(cgImage: cgThumbImage)
                    imageCache.setObject(imageForCache, forKey: urlStr as NSString)
                    if self.videoUrl == urlStr{
                        self.image = imageForCache
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.image = nil
                }
            }
        }
    }

}
