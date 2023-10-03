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
    @Published private (set) var searchItems: [InventoryItem]?
    
    let baseURL = URL(string: URLCONSTANTS.invBase)!

    // MARK: - web functions
    
    var inventoryItemControllerStatus: ControllerStatus = .idle
    private var requestCancellable: AnyCancellable?
    
    func fetchAllItems() {
        let url = URL(string: "/inventoryItems/", relativeTo: baseURL)!
        
        let request = AuthenticationViewModel.authRequestBuilder(url: url)!
        
        inventoryItemControllerStatus = .fetching
        requestCancellable?.cancel()
        
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: request)
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
    
    
    func searchInv(search: String) {
        let url = URL(string: "/inventoryItems/name/" + search, relativeTo: baseURL)!
        
        let req = AuthenticationViewModel.authRequestBuilder(url: url)!
        
        requestCancellable?.cancel()
        
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: req)
            .tryMap { (data, response) -> [InventoryItem]? in
                
                print(response)
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                var items: [InventoryItem]?
                do {
                    
                    items = try JSONDecoder().decode(Array<InventoryItem>.self, from: data)
                    dump(items)
                } catch {
                    print("Error decodong data for url: \(url) in InventoryItemController.getAllItems() \n \n \(error)")
                }
                return items
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
        
        requestCancellable = publisher
            .sink { [weak self] items in
                self?.searchItems = items
                self?.inventoryItemControllerStatus = items != nil ? .idle : .failed(url)
            }
    }
}
