import Foundation
import SwiftUI

struct KeyboardOffsetView: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("This text field will be occluded by the keyboard. SwiftUI ensures that the TextField is still visible.\n\nDoing the same in UIKit is excessively tedious.")
                    .multilineTextAlignment(.center)
                TextField("Text field. Tap me!", text: $text)
                    .padding()
                Button("Dismiss keyboard") {
                    dismissKeyboard()
                }
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(8)
            .padding()
        }
    }

    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct KeyboardOffsetView_previews: PreviewProvider {
    static var previews: some View {
        KeyboardOffsetView()
    }
}
