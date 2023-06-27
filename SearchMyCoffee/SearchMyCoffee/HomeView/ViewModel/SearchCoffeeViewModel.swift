//
//  SearchCoffeeViewModel.swift
//  SearchMyCoffee
//
//  Created by Aaban Tariq on 25/06/2023.
//

import Foundation
import SwiftUI

final class SearchCoffeeViewModel: ObservableObject {
    internal init() {
        fetchCoffees()
    }    
    
    var allCoffees: [CoffeeItemResponseModel]?
    @Published var filteredCoffees: [CoffeeItemResponseModel]?
    @Published var selectedCoffee = CoffeeItemResponseModel(blendName: "", variety: "", origin: "")
    
    private func fetchCoffees() {
        guard let url = URL(string: "https://random-data-api.com/api/coffee/random_coffee?size=20") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    do {
                        self.allCoffees = try JSONDecoder().decode([CoffeeItemResponseModel].self, from: data)
                        self.filteredCoffees = self.allCoffees
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func filterCoffees(searchText: String) -> [CoffeeItemResponseModel]? {
        if searchText.isEmpty {
            return self.filteredCoffees
        } else {
            return self.filteredCoffees?.filter({ item in
                item.blend_name?.contains(searchText) ?? false
            })
        }
    }
    
    func setSelectedCoffee(coffee: CoffeeItemResponseModel){
        selectedCoffee = coffee
    }
}
