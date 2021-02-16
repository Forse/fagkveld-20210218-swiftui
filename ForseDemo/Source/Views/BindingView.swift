import Foundation
import SwiftUI

struct BindingView: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            Toggle("Is this thing on?", isOn: $isOn)

            if isOn {
                Text("Yup, it's on!")
            } else {
                Text("Nope! :(")
            }
        }
        .padding()
    }
}

struct BindingView_previews: PreviewProvider {
    static var previews: some View {
        BindingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
