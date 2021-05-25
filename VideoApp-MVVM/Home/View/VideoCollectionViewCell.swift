//
//  VideoCollectionViewCell.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbNail: VideoImageView!
    var index = 0
    var videoURL:String?{
        didSet{
            self.conFigureCell(url: videoURL ?? "")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.videoURL = nil
        self.thumbNail.image = nil
    }
    
    func conFigureCell(url:String){
        self.thumbNail.image = nil
        self.thumbNail.imageFormVideoUrl(urlStr:url)
    }

}
