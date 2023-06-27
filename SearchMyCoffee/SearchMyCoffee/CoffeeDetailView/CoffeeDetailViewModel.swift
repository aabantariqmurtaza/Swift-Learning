//
//  CoffeeDetailViewModel.swift
//  SearchMyCoffee
//
//  Created by Aaban Tariq on 27/06/2023.
//

import UIKit

final class CoffeeDetailViewModel: NSObject, ObservableObject {
    internal init(coffeeItem: CoffeeItemResponseModel) {
        self.coffeeItem = coffeeItem
    }
    
    @Published var datasourceItems: [DetailCellModel]?
    var coffeeItem: CoffeeItemResponseModel
}

extension CoffeeDetailViewModel {
    func generateDatasource(){
        var tempDatasource: [DetailCellModel] = []
        tempDatasource.append(DetailCellModel(title: "Blend Name", value: coffeeItem.blend_name ?? ""))
        tempDatasource.append(DetailCellModel(title: "Origin", value: coffeeItem.origin ?? ""))
        tempDatasource.append(DetailCellModel(title: "Variety", value: coffeeItem.variety ?? ""))
        datasourceItems = tempDatasource
    }
}

struct DetailCellModel: Identifiable {
    var id = UUID()
    var title: String
    var value: String
}

