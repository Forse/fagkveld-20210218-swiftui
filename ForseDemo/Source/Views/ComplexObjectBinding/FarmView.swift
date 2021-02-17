import Foundation
import SwiftUI

struct FarmView: View {
    @EnvironmentObject var viewModel: FarmViewModel

    var body: some View {
        ZStack {
            VStack {
                AnimalListView(viewModel: viewModel)
                AddAnimalView(viewModel: viewModel)
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

fileprivate struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.5))
            Rectangle()
                .foregroundColor(Color.black.opacity(0.7))
                .frame(width: 250, height: 250)
                .cornerRadius(40)
            ProgressView()
        }
        .ignoresSafeArea()
    }
}

fileprivate struct AnimalListView: View {
    @ObservedObject var viewModel: FarmViewModel

    var body: some View {
        List() {
            ForEach(viewModel.animals) { animal in
                VStack {
                    HStack {
                        Text("\(animal.count) x \(animal.animalType.rawValue)")
                            .font(.title)
                        Spacer()
                    }
                    if !animal.description.isEmpty {
                        HStack {
                            Text(animal.description)
                                .font(.callout)
                                .italic()
                            Spacer()
                        }
                    }
                }
            }.onDelete(perform: viewModel.delete(at:))
        }
    }
}

fileprivate struct AddAnimalView: View {
    @ObservedObject var viewModel: FarmViewModel

    @State private var selectedAnimal: AnimalType = AnimalType.allCases[0]
    @State private var animalCount: Int = 0
    @State private var description: String = ""

    var body: some View {
        VStack {
            Text("Add a new animal")
                .font(.title2)
            Picker("Animal Type", selection: $selectedAnimal) {
                ForEach(AnimalType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            Stepper("Count: \(animalCount)", value: $animalCount)
            TextField("Describe your animal(s)", text: $description)
            Button("Add", action: addButtonTapped)
        }
        .padding()
        .background(Color.blue.opacity(0.3))
        .cornerRadius(40)
        .shadow(radius: 10)
        .padding()
    }

    private func addButtonTapped() {
        let animal = FarmAnimal(animalType: selectedAnimal,
                                count: animalCount,
                                description: description)
        viewModel.addAnimal(animal)

        // Reset the view
        animalCount = 0
        description = ""

        // Hide the keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct FarmView_preview: PreviewProvider {
    static var previews: some View {
        // Simulate the state for the previews
        let viewModel = FarmViewModel()
        viewModel.isLoading = true
        viewModel.animals = [FarmAnimal(animalType: .🐔, count: 10, description: "har ti")]

        return FarmView()
            .previewLayout(.sizeThatFits)
            .environmentObject(viewModel)
    }
}
