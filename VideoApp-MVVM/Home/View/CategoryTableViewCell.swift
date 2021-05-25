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
    var tableCellViewModel:TableCellViewModel?{
        didSet{
            if let videoCategoryModel = tableCellViewModel?.categoryData{
                self.conFigureCell(videoCategoryModel:videoCategoryModel)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "VideoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "VideoCollectionViewCell")
        tableCellViewModel = TableCellViewModel()
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
        (tableCellViewModel?.categoryData?.nodes!.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.thumbNail.image = nil
        let model = CollectionCellViewModel()
        model.index = indexPath.row
        model.categoryData = tableCellViewModel?.categoryData
        model.vc = tableCellViewModel?.vc
        cell.collectionCellViewModel = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        let model = PlayerViewModel()
        model.categoryData = tableCellViewModel?.categoryData
        model.baseIndex = indexPath.row
        nextViewController.playerViewModel = model
        self.tableCellViewModel?.vc?.navigationController?.pushViewController(nextViewController, animated: true)
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
