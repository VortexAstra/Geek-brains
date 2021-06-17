//
//  UserSettings.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 16.05.2021.
//

import Foundation

final class UserSettings {

    private enum SettingsKey: String {
        case gameSession
    }

    static var gameSession: GameSession {
        get {
            guard let data = UserDefaults.standard.object(forKey: SettingsKey.gameSession.rawValue) as? Data,
                  let decodeModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? GameSession else { return GameSession() }
            return decodeModel
        }

        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.gameSession.rawValue

            if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) {
                defaults.set(savedData, forKey: key)
            }
        }
    }
}

final class DBEmitator<Object: Codable> {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private lazy var key: String = {
        String(describing: Object.self)
    }()

    func save(results: [Object]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveResults() -> [Object] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Object].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

