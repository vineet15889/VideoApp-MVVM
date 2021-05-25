//
//  VideoCollectionViewCell.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbNail: VideoImageView!
    var collectionCellViewModel:CollectionCellViewModel?{
        didSet{
            if let videoCategoryModel = collectionCellViewModel?.categoryData?.nodes{
                let index = collectionCellViewModel?.index
                self.conFigureCell(url: videoCategoryModel[index!].video?.encodeUrl ?? "")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbNail.image = nil
    }
    
    func conFigureCell(url:String){
        self.thumbNail.image = nil
        self.thumbNail.imageFormVideoUrl(urlStr:url)
    }

}
