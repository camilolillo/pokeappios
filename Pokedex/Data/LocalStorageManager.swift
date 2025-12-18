import SwiftData

enum LocalStorageError: Error {
    case saveFailed
    case fetchFailed
    case deleteFailed
}

protocol LocalStorageManagerProtocol {
    func saveSession(username: String) -> Result<Void, LocalStorageError>
    func fetchSession() -> Result<UserSession?, LocalStorageError>
    func clearSession() -> Result<Void, LocalStorageError>
}

final class LocalStorageManager {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }
}

extension LocalStorageManager: LocalStorageManagerProtocol {

    func saveSession(username: String) -> Result<Void, LocalStorageError> {
        let session = UserSession(username: username, isLoggedIn: true)
        context.insert(session)
        do {
            try context.save()
            return .success(())
        } catch {
            return .failure(.saveFailed)
        }
    }

    func fetchSession() -> Result<UserSession?, LocalStorageError> {
        let descriptor = FetchDescriptor<UserSession>()
        do {
            let sessions = try context.fetch(descriptor)
            return .success(sessions.first)
        } catch {
            return .failure(.fetchFailed)
        }
    }

    func clearSession() -> Result<Void, LocalStorageError> {
        let descriptor = FetchDescriptor<UserSession>()
        do {
            let sessions = try context.fetch(descriptor)
            sessions.forEach { context.delete($0) }
            try context.save()
            return .success(())
        } catch {
            return .failure(.deleteFailed)
        }
    }
}

