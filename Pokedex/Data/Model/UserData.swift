import SwiftData

@Model
final class UserSession {
    var username: String
    var isLoggedIn: Bool

    init(username: String, isLoggedIn: Bool) {
        self.username = username
        self.isLoggedIn = isLoggedIn
    }
}
