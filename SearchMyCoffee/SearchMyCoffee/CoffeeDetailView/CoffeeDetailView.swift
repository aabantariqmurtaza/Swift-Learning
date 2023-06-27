//
//  CoffeeDetailView.swift
//  SearchMyCoffee
//
//  Created by Aaban Tariq on 27/06/2023.
//

import SwiftUI

struct CoffeeDetailView: View {
    internal init(viewModel: CoffeeDetailViewModel, showDetailView: Binding<Bool>) {
        self.viewModel = viewModel
        self.showDetailView = showDetailView
        self.viewModel.generateDatasource()
    }
    
    @ObservedObject var viewModel: CoffeeDetailViewModel
    var showDetailView: Binding<Bool>
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Selected Coffee")
                    .bold()
                Spacer()
                ForEach(viewModel.datasourceItems ?? []) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Text(item.value)
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20))
                }
                Spacer()
                Button("Cancel") {
                    showDetailView.wrappedValue = false
                }.buttonStyle(.bordered)
                Spacer()
            }
            .frame(width: 300, height: 250)
            .border(.black)
            .background(.white)
        }
        
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(viewModel: CoffeeDetailViewModel(coffeeItem: CoffeeItemResponseModel(blendName: "Test", variety: "Test", origin: "Test")), showDetailView: .constant(true))
    }
}
