import Foundation
import SwiftUI

struct SuperBasicView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(Color.red)
            HStack {
                Text("🐴")
                    .padding(.leading)
                Spacer()
            }
        }
    }
}

struct SuperBasicView_preview: PreviewProvider {
    static var previews: some View {
        SuperBasicView()
            .previewLayout(.sizeThatFits)
            .frame(width: 150)
    }
}
