//
//  Game.swift
//  millionaireGame
//
//  Created by Ke4a on 30.05.2022.
//

import Foundation

final class GameLayer: ResultsCaretakerLayer {
    // MARK: - Private Properties

    private(set) var session: GameSessionModel?
    private(set) var results: [ResultModel] = [] {
        didSet {
            if !self.results.isEmpty {
                save(records: self.results)
            }
        }
    }

    // MARK: - Static Properties

    static var shared = GameLayer()

    // MARK: - Initialization

    private override init() {
        super.init()
        session = nil
        self.results = retrieveResults()
    }

    // MARK: - Public Methods

    func newGame(name: String) {
        session = GameSessionModel(name: name)
    }

    func endGame() {
        writeResult()
        session = nil
    }

    // MARK: - Private Methods
    
    private func writeResult() {
        guard let session = session else { return }
        results.append(.init(name: session.name, level: session.level - 1))
    }
}
