//
//  ViewController.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var videoViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        videoViewModel.getData()
        videoViewModel.vc = self
        self.setupUI()
        
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func setupUI(){
        self.title = "Explore"
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    
    //    MARK Tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoViewModel.videoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let videoCategoryModel = videoViewModel.videoArray[indexPath.row]
//        cell.videoModel = videoCategoryModel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.width / 1.5
    }
    
    
}


