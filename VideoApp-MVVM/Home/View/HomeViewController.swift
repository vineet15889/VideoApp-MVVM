//
//  ViewController.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var homeViewModel = HomeViewModel()
    let simpleOver = SimpleOver()
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getData()
        homeViewModel.vc = self
        navigationController?.delegate = self
        self.setupUI()
        
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func setupUI(){
        self.title = "Explore"
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        self.navigationItem.backButtonTitle = ""
    }
    
    
    //    MARK Tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.videoCategoryArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let videoCategoryModel = homeViewModel.videoCategoryArray[indexPath.row]
        cell.tableCellViewModel?.categoryData = videoCategoryModel
        cell.tableCellViewModel?.vc = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.width / 1.5
    }
    
}

extension HomeViewController:UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    func navigationController(
            _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
            from fromVC: UIViewController,
            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            
            simpleOver.popStyle = (operation == .pop)
            return simpleOver
        }
}


