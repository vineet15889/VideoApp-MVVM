//
//  CategoryTableViewCell.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var HomeDataModels:HomeDataModels?{
        didSet{
            self.conFigureCell(videoCategoryModel: HomeDataModels!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "VideoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "VideoCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func conFigureCell(videoCategoryModel:HomeDataModels){
        self.categoryLabel.text = videoCategoryModel.title
        self.collectionView.reloadData()
    }
    
}

extension CategoryTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (HomeDataModels?.nodes!.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.thumbNail.image = nil
        cell.videoURL = nil
        cell.videoURL = HomeDataModels?.nodes![indexPath.row].video?.encodeUrl
        return cell
    }
    
}

extension CategoryTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.collectionView.bounds.width / 2.5, height: self.collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
   
}
