import SwiftUI

// TODO: UI refines
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("JoyPet")
                Image(systemName: "dog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Character Creator")
                Text("Enter the world of character creation")
                
                NavigationLink(destination: {
                    LoginView()
                        .toolbar(.hidden)
                }) {
                    Text("Get Started")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    WelcomeView()
}
