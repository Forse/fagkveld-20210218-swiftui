import Foundation

enum AnimalType: String, CaseIterable {
    case 🐮
    case 🐷
    case 🐴
    case 🐔
    case 🦃
    case 🐪
    case 🐯
    case 🦁
    case 🐼
}

extension AnimalType: Identifiable {
    var id: Int { rawValue.hashValue }
}
