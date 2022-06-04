//
//  GameSessionModel.swift
//  millionaireGame
//
//  Created by Ke4a on 30.05.2022.
//

import Foundation

final class GameSessionModel {
    var name: String
    var level: Observable<Int> = Observable<Int>(0)
    var history: [[String]] = []

    init(name: String) {
        self.name = name
    }
}
