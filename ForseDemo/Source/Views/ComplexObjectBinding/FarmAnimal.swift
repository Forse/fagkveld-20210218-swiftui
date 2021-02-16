import Foundation

struct FarmAnimal: Identifiable {
    let id = UUID()

    let animalType: AnimalType
    let count: Int
    let description: String
}
