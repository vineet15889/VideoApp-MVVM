//
//  VideoCategoryModels.swift
//  VideoApp-MVVM
//
//  Created by Vineet Rai on 25/05/21.
//

import Foundation

struct HomeDataModels : Codable {
    let title : String?
    let nodes : [Nodes]?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case nodes = "nodes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        nodes = try values.decodeIfPresent([Nodes].self, forKey: .nodes)
    }

}

struct Nodes : Codable {
    let video : Video?

    enum CodingKeys: String, CodingKey {

        case video = "video"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        video = try values.decodeIfPresent(Video.self, forKey: .video)
    }

}

struct Video : Codable {
    let encodeUrl : String?

    enum CodingKeys: String, CodingKey {

        case encodeUrl = "encodeUrl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        encodeUrl = try values.decodeIfPresent(String.self, forKey: .encodeUrl)
    }

}
