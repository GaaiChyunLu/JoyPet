import SwiftUI

// TODO: UI refines
enum TabbedItems: Int, CaseIterable {
    case home = 0
    case create
    case explore
    case joyPet
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .create:
            "Create"
        case .explore:
            "Explore"
        case .joyPet:
            "JoyPet"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            "house"
        case .create:
            "pencil"
        case .explore:
            "safari"
        case .joyPet:
            "pawprint.fill"
        }
    }
}

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                CreateView()
                    .tag(1)
                
                ExploreView()
                    .tag(2)
                
                JoyPetView()
                    .tag(3)
            }
            
            HStack(spacing: 0) {
                ForEach((TabbedItems.allCases), id: \.self) { item in
                    Button(action: {
                        selectedTab = item.rawValue
                    }) {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                    }
                }
            }
            .frame(width: UIScreen.screenBounds.width, height: 70)
        }
    }
}

extension ContentView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
            }
            Spacer()
        }
        .foregroundColor(isActive ? .blue : .gray)
        .frame(width: UIScreen.screenBounds.width / 4, height: 70)
    }
}

#Preview {
    ContentView()
}
