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
        ZStack {
            List {
                NavigationLink(destination: SuperBasicView()) {
                    Text("🦴 Super basic view")
                }

                NavigationLink(destination: HorseView()) {
                    Text("🐴 Horse view")
                }

                NavigationLink(destination: BindingView()) {
                    Text("↪️ Property binding")
                }

                NavigationLink(destination: SimpleObjectBindingView()) {
                    Text("↔️ Simple object binding")
                }

                NavigationLink(destination: KeyboardOffsetView()) {
                    Text("⌨️ Keyboard offset view")
                }

                NavigationLink(destination:
                    FarmView()
                        .environmentObject(FarmViewModel())
                ) {
                    Text("🚜 Bondegård")
                }
            }

            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("ForseLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
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
