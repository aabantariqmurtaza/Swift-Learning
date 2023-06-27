//
//  ContentView.swift
//  SearchMyCoffee
//
//  Created by Aaban Tariq on 25/06/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coffeVM: SearchCoffeeViewModel = SearchCoffeeViewModel()
    @State var showDetailView: Bool = false
//    var coffeVM: SearchCoffeeViewModel = SearchCoffeeViewModel()
    @State var searchText: String = ""
    var body: some View {
        ZStack {
            VStack {
                SearchBar(searchedText: $searchText)
                if let filtered = coffeVM.filterCoffees(searchText: searchText) {
                    List {
                        ForEach(filtered) { coffee in
                            Text(coffee.blend_name ?? "").onTapGesture {
                                showDetailView = true
                                coffeVM.setSelectedCoffee(coffee: coffee)
                            }
                        }
                    }
                }
            }
            if showDetailView {
                CoffeeDetailView(viewModel: CoffeeDetailViewModel(coffeeItem: coffeVM.selectedCoffee), showDetailView: $showDetailView)
            }            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
