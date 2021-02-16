import SwiftUI

struct HorseView: View {
    var body: some View {
        HStack {
            Image("hest")
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .mask(Circle())
            VStack(spacing: 10) {
                HStack {
                    Text("Dette er en hest.")
                        .font(.body)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("Det er mange som den, men denne er min. Uten hesten min er jeg ingenting.")
                        .font(.caption)
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
    }
}

struct HorseView_Previews: PreviewProvider {
    static var previews: some View {
        HorseView()
    }
}
