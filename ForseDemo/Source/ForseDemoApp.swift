import SwiftUI

@main
struct ForseDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RootView()
            }
        }
    }
}

struct RootView: View {
    var body: some View {
        List {
            NavigationLink(destination: SuperBasicView()) {
                Text("Super basic view")
            }

            NavigationLink(destination: HorseView()) {
                Text("Horse view")
            }

            NavigationLink(destination: BindingView()) {
                Text("Binding view")
            }

            NavigationLink(destination: SimpleObjectBindingView()) {
                Text("Simple binding")
            }

            NavigationLink(destination:
                FarmView()
                    .environmentObject(FarmRepository())
            ) {
                Text("Complex binding")
            }
        }
        .navigationTitle("Forse Fagkveld")
    }
}


struct RootView_preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootView()
        }
    }
}
