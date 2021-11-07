//
//  RecipeController.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/31/21.
//

import Foundation


final class RecipeController:ObservableObject {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    private var baseURL = URL(string: "http://192.168.1.125:2021")!
    private lazy var recipesURL = URL(string: "/recipes", relativeTo: baseURL)!
//    private var task: URLSessionTask?

    @Published var recipes: [RecipeSummary] = []
    @Published var recipe: Recipe = loadFromFile("emptyRecipe.json")
    var defaultRecipe: Recipe = loadFromFile("recipe.json")
    
    func getAllRecipes () {
        let recipesUrl = requestBuilder(recipesURL, true)!
        
        
        
        let task = URLSession.shared.dataTask(with: recipesUrl, completionHandler: {[weak self] data, response, error in
            if let error = error {
//            TODO: proper error handling
                print("Error fetching all recipes: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      print("Error fetching all recipes, response status code != 2xx)")
                      return
                  }
            
            guard let self = self else { return }
            
            guard let data = data else {
                print("Error fetching all recipes, no data returned from request")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let wrapper = try jsonDecoder.decode(Wrapper.self, from: data)

                DispatchQueue.main.async {
                    self.recipes = wrapper.data
                }

            } catch {
                print("Error decoding request data into instance of RecipeSummary: \(error)")
            }
        })
        task.resume()
    }
    
    func getRecipe(_ id: Int) {
        let recipeReq = requestBuilder(URL(string: "/recipes/\(id)", relativeTo: baseURL)!, true)!
        
        URLSession.shared.dataTask(with: recipeReq, completionHandler: { [weak self] data, response, error in
            if let error = error {
                print("Error fetching recipe: \(error)")
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      print("Error fetching recipe \(id)")
                      return
                  }
            
            guard let self = self else { return }
            
            guard let data = data else {
                print("Error fetching recipe, no data returned from request")
                return
            }
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let recipe = try decoder.decode(Recipe.self, from: data)
                
                DispatchQueue.main.async {
                    self.recipe = recipe
                }
            } catch {
                print("Error decoding request into instance of Recipe: \(error)")
            }
//            completion()
        }).resume()
        return
    }
    
    
    
    func requestBuilder (_ url: URL,_ resolving: Bool = false,
                         _ method: HTTPMethod = HTTPMethod.get) -> URLRequest? {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: resolving)
        
        guard let url = urlComponents?.url else {
            print("Error building request, url is nil")
            return nil
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = method.rawValue
        
        return req
    }
}


func loadFromFile<T: Decodable> (_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
