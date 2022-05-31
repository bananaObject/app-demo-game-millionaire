//
//  RecordsCaretaker.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import Foundation

class ResultsCaretakerLayer {
    // MARK: - Private Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "records"

    // MARK: - Public Methods
    func save(records: [ResultModel]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveResults() -> [ResultModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([ResultModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
