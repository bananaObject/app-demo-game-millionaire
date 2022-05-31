//
//  GameSession.swift
//  millionaireGame
//
//  Created by Ke4a on 30.05.2022.
//

import Foundation

final class GameSession {
    var name: String
    var level: Int = 0
    var history: [[String]] = []

    init(name: String) {
        self.name = name
    }
}
