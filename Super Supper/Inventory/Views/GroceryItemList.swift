//
//  GroceryItemList.swift
//  Super Supper
//
//  Created by Andrew Shields on 4/8/23.
//

import SwiftUI

struct GroceryItemList: View {
    
    @EnvironmentObject var groVM: GroceryItemViewModel
    /**
     when we look at out inventory what do we want to see?
     What  information is important to us?
        I want categorized items, able to be changed
        and color coordinated with special badges to indicate any special statuses
     
        It is important to list the name, in/emp date and available qty at the very least if not more. 
     */
    
    
    var body: some View {
        List {
            if groVM.groceryItems != nil {
                ForEach(groVM.groceryItems!) { item in
                    HStack {
                        Text(item.name)
                        Text("\(item.availableQty) / \(item.qty)")
                        VStack {
                            Text(item.inDate.formatted(date: .numeric, time: .omitted))
                            Text(item.expDate.formatted(date: .numeric, time: .omitted))
                        }
                        .font(.footnote)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            groVM.fetchGroceryItems()
        }
    }
}

struct GroceryItemList_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemList()
            .environmentObject(GroceryItemViewModel())
    }
}
