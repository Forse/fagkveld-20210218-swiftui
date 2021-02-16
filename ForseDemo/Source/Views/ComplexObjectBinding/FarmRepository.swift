import Foundation
import SwiftUI

class FarmRepository: ObservableObject {
    @Published var animals: [FarmAnimal] = []
    @Published var isLoading: Bool = false

    private var loadCount: Int = 0

    func addAnimal(_ animal: FarmAnimal) {
        loadCount += 1
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: 0.5 ... 2)) {
            self.animals.append(animal)
            self.loadCount -= 1
            if self.loadCount == 0 {
                self.isLoading = false
            }
        }
    }

    func delete(at offsets: IndexSet) {
        loadCount += 1
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: 0.1 ... 0.5)) {
            self.animals.remove(atOffsets: offsets)
            self.loadCount -= 1
            if self.loadCount == 0 {
                self.isLoading = false
            }
        }
    }
}
