//
//  ResultModel.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import Foundation

struct ResultModel: Codable {
    let name: String
    let level: Int

    var resultString: String {
        "\(level + 1) / 15"
    }
}
