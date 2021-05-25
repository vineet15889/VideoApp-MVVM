//
//  PlayerViewModel.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import UIKit

class PlayerViewModel{
    var categoryData:HomeDataModels?
    weak var vc:PlayerViewController?
    var baseIndex:Int = 0
    
    func playCurrentData(){
        if let model = categoryData?.nodes{
            let url = (model[baseIndex].video?.encodeUrl)!
            vc?.playVideo(url: URL(string: url)!)
        }
    }
}
