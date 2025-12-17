import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    @State private var userName: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack(spacing: 12) {
                HStack(alignment: .center) {
                    Image("pokeball")
                    Image("pokedex")
                }
                VStack(alignment: .center, spacing: 8) {
                    TextField("Usuario", text: $userName)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                Button(action: onLoginButtonPressed) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(Color.white)
                }
                .padding(.top, 12)
                .alert("Campos incompletos", isPresented: $viewModel.showEmptyFieldsAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Debes ingresar usuario y contraseña.")
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

extension LoginView {
    func onLoginButtonPressed() {
        viewModel.onLoginButtonPressed(userName: userName, password: password)
    }
    
}
