//
//  GroceryItemViewModel.swift
//  Super Supper
//
//  Created by Andrew Shields on 4/8/23.
//

import Foundation
import Combine

final class GroceryItemViewModel: ObservableObject {
    
    @Published private (set) var groceryItems: [GroceryInventoryItem]?
    
    let baseURL = URL(string: URLCONSTANTS.invBase + "/groceryItems/")!
    
    var groceryItemControllerStatus: ControllerStatus = .idle
    private var requestCancellable: AnyCancellable?
    
    
    func fetchGroceryItems() {
        let req = AuthenticationViewModel.authRequestBuilder(url: baseURL)!
        
        groceryItemControllerStatus = .fetching
        requestCancellable?.cancel()
        
        var session = URLSession.shared
        var publisher = session.dataTaskPublisher(for: req)
            .tryMap { (data, urlResponse) -> [GroceryInventoryItem]? in
                guard let httpResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                var items: [GroceryInventoryItem]?
                do {
                    var decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(GroceryInventoryItem.dateFormatter)
                    items = try decoder.decode(Array<GroceryInventoryItem>.self, from: data)
                } catch {
                    print("Error decodong data for url: \(req.url) in GroceryItemController.fetchGroceryItems() \n \n \(error)")
                }
                return items
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
        
        requestCancellable = publisher
            .sink { [weak self] items in
                self?.groceryItems = items
                self?.groceryItemControllerStatus = items != nil ? .idle : .failed(req.url!)
            }
    }
}
