import Foundation
import SwiftUI

/// Illustrates the importance of ordering of view modifiers.
/// May make little sense without the presentation.
struct ModifierDemoView: View {
    var body: some View {
        ZStack {
            Color.green

            HStack(spacing: 0) {
                ContentView()
                ContentView()
            }

        }.ignoresSafeArea()
    }
}

fileprivate struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .frame(height: 100)
            Text("My view! :D")
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
    }
}

struct ModifierDemoView_preview: PreviewProvider {
    static var previews: some View {
        ModifierDemoView()
    }
}
