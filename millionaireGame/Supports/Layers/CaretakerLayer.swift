//
//  CaretakerLayer.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import Foundation

protocol CaretakerModelMarker: Codable {}

extension CaretakerLayer {
    // MARK: - Cases
    enum CaretakerKey: String {
        case records
        case userQuestion
    }
}

class CaretakerLayer {
    // MARK: - Private Properties

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    // MARK: - Public Methods

    func save<T: Encodable>(records: [T], key: CaretakerKey) {
        // Проверяю правильные ли передали данные
        switch key {
        case .records:
            guard records is [ResultModel] else { return }
        case .userQuestion:
            guard records is [QuestionModel] else { return }
        }

        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key.rawValue)
        } catch {
            print(error)
        }
    }

    func retrieveResults(key: CaretakerKey) -> [CaretakerModelMarker] {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else {
            return []
        }

        do {
            switch key {
            case .records:
                return try self.decoder.decode([ResultModel].self, from: data)
            case .userQuestion:
                return try self.decoder.decode([QuestionModel].self, from: data)
            }
        } catch {
            print(error)
            return []
        }
    }
}
