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

    static let shared = LocalStorageManager()

    private let container: ModelContainer
    private let context: ModelContext

    private init() {
        do {
            container = try ModelContainer(for: UserSession.self)
            context = ModelContext(container)
        } catch {
            fatalError("Failed to initialize SwiftData: \(error)")
        }
    }
}

extension LocalStorageManager: LocalStorageManagerProtocol {

    func saveSession(username: String) -> Result<Void, LocalStorageError> {
        let session = UserSession(username: username, isLoggedIn: true)
        context.insert(session)
        return .success(())
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
            return .success(())
        } catch {
            return .failure(.deleteFailed)
        }
    }
}
