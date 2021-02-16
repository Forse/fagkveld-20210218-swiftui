import Foundation
import SwiftUI

fileprivate struct Item: Identifiable {
    let id = UUID()

    let name: String
    let description: String
    let count: Int
}

fileprivate class ViewModel: ObservableObject {
    @Published var items: [Item]

    init() {
        items = [
            Item(name: "Egg", description: "Kommer fra høna", count: 40),
            Item(name: "Melk", description: "Kan kjøpes på butikken", count: 1),
            Item(name: "Deodorant", description: "Til pynt", count: 1),
        ]
    }

    func addItem() {
        let item = Item(name: "Noe nytt", description: "Usikker på hva det er", count: 0)
        items.append(item)
    }
}

struct SimpleObjectBindingView: View {
    @StateObject fileprivate var viewModel: ViewModel

    // This initializer is fileprivate to keep `ViewModel` contained within
    // this file. Normally, this initializer would either be internal/public, or
    // we would get our `ViewModel` from the environment.
    //
    // Regardless, this class would have no explicit constructors under normal
    // circumstances.
    fileprivate init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: ViewModel())
    }

    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }

    var body: some View {
        VStack {
            List(viewModel.items, rowContent: row(for:))
            Button("Add new", action: viewModel.addItem)
        }
    }

    private func row(for item: Item) -> some View {
        return HStack {
            VStack {
                HStack {
                    Text(item.name)
                    Spacer()
                }
                HStack {
                    Text(item.description)
                        .font(.caption)
                    Spacer()
                }
            }
            Spacer()
            Text("\(item.count)")
                .font(.title3)
        }
    }
}

struct SimpleObjectBindingView_preview: PreviewProvider {
    static var previews: some View {
        SimpleObjectBindingView(viewModel: ViewModel())
    }
}
