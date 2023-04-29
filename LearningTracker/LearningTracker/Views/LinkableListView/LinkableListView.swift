//
//  LinkableListView.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 19/04/2023.
//

import SwiftUI

struct LinkableListView: View {
  @Binding var learningItemsWrappers: [LearningItemWrapper]
  @State var tempList =  [0]
  var body: some View {
    List($learningItemsWrappers, id:\.id) { $wrapper in
      NavigationLink {
        LearningItemWithoutNavigationStack(learningItemWrapper: $wrapper)
          .navigationTitle($wrapper.learningItem.name)
      } label: {
        HStack {
          Text(wrapper.learningItem.name)
        }
      }
    }
    .frame(maxHeight: CGFloat(learningItemsWrappers.count) * 80)
    .listStyle(.grouped)
    
    // I used a temp list now, as iterating over 'learningItemsWrappers' was dismissing top VC
    // But still same problem
//    List($tempList, id:\.self) { index in
//      NavigationLink {
//        LearningItemView(learningItemWrapper: $learningItemsWrappers[index.wrappedValue])
//          .navigationTitle(learningItemsWrappers[index.wrappedValue].learningItem.name)
//      } label: {
//        HStack {
//          Text(learningItemsWrappers[index.wrappedValue].learningItem.name)
//        }
//      }
//    }.frame(maxHeight: CGFloat(learningItemsWrappers.count) * 80)
//      .listStyle(.grouped)
  }
  
    
    // to connect binding between source of truth and child, first i used below technique
//    List {
//      ForEach(learningItemsWrappers.indices, id: \.self) { index in
//        NavigationLink {
//          LearningItemView(learningItemWrapper: $learningItemsWrappers[index])
//            .navigationTitle(learningItemsWrappers[index].learningItem.name)
//        } label: {
//          HStack {
//            Text(learningItemsWrappers[index].learningItem.name)
//          }
//        }
//      }
//    }
//    .frame(maxHeight: CGFloat(learningItemsWrappers.count) * 80)
//    .listStyle(.grouped)
}
struct LinkableListView_Previews: PreviewProvider {
  static var previews: some View {
    LinkableListView(learningItemsWrappers: .constant(DataProvider.provideLearnings().learningItem.listOfItems))
  }
}
