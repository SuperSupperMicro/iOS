//
//  InventoryItemViewModel.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/7/23.
//

import SwiftUI
import Combine

final class InventoryItemViewModel: ObservableObject {
    
    @Published private (set) var inventoryItems: [InventoryItem]?
    @Published private (set) var currentItem: InventoryItem?
    
    let baseURL = URL(string: "http://192.168.1.199:2023")!

    // MARK: - web functions
    
    var inventoryItemControllerStatus: InventoryItemControllerStatus = .idle
    private var requestCancellable: AnyCancellable?
    
    func fetchAllItems() {
        let url = URL(string: "/inventoryItems/", relativeTo: baseURL)!
        inventoryItemControllerStatus = .fetching
        requestCancellable?.cancel()
        
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: url)
            .retry(1)
            .tryMap { (data, urlResponse) -> [InventoryItem]? in
                
                guard let httpResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                var items: [InventoryItem]?
                do {
                    items = try JSONDecoder().decode(Array<InventoryItem>.self, from: data)
                } catch {
                    print("Error decodong data for url: \(url) in InventoryItemController.getAllItems() \n \n \(error)")
                }
                return items
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
        
        requestCancellable = publisher
            .sink { [weak self]  items in
                self?.inventoryItems = items
                self?.inventoryItemControllerStatus = items != nil ? .idle : .failed(url)
                print("Success fetching items: \(String(describing: items))")
            }
    }
    
    func postNewInvItem(item: InventoryItem) {
        let url = URL(string: "/inventoryItems/", relativeTo: baseURL)!
        
        guard let json = try? JSONEncoder().encode(item)
        else {
            print("Error encoding JSON item; InventoryItemViewModel.postNewInvItem")
            dump(item)
            return
        }
        
        let req = requestBuilder(url, resolvingAgianstBaseURL: true, method: .post)!
        
        urlSessonUploadTaskBuilder(request: req, data: json)
    }
    
    enum InventoryItemControllerStatus: Equatable {
        case idle
        case fetching
        case sending
        case failed(URL)
    }
}
