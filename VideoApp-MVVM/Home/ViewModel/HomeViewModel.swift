//
//  HomeViewModel.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class HomeViewModel{
    var videoCategoryArray = [HomeDataModels]()
    weak var vc:HomeViewController?
    func getData(){
        guard let url = Bundle.main.url(forResource: "assignment", withExtension: "json") else { return  }
        guard let data = try? Data(contentsOf: url) else { return  }
        let jsonDecoder = JSONDecoder()
        do {
            let responseModel = try jsonDecoder.decode([HomeDataModels].self, from: data)
            videoCategoryArray.append(contentsOf: responseModel)
            vc?.tableView.reloadData()
            print("Got data")
        } catch {
            print("Error Accured")
        }
       
    }
}

