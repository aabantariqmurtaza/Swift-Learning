//
//  SearchBar.swift
//  SearchMyCoffee
//
//  Created by Aaban Tariq on 25/06/2023.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchedText: String
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        //
    }
    
    typealias UIViewType = UISearchBar
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchedTextVal: $searchedText)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        internal init(searchedTextVal: Binding<String>) {
            self.searchedText = searchedTextVal
            super.init()
        }
        
        var searchedText: Binding<String>
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.searchedText.wrappedValue = searchBar.text ?? ""
        }
    }
}



