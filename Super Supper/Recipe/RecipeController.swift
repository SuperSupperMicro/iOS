//
//  RecipeController.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/31/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

final class RecipeController : ObservableObject {
    
//    private var baseURL = URL(string: "http://192.168.1.125:2021")!
    private var baseURL = URL(string: "http://127.0.0.1:2023")!
    private lazy var recipesURL = URL(string: "/recipes", relativeTo: baseURL)!
    
    @Published var recipes: [RecipeSummary] = []
    @Published var recipe: Recipe? = nil
    var defaultRecipe: Recipe? = nil
    
    func getAllRecipes () {
        let recipesUrl = requestBuilder(recipesURL, resolvingAgianstBaseURL: true)!
        
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
        let recipeReq = requestBuilder(URL(string: "/recipes/\(id)", relativeTo: baseURL)!, resolvingAgianstBaseURL: true)!
        
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
        }).resume()
        return
    }
    
    func postNewRecipe(
        title: String,
        description: String,
        url: String,
        imgUrl: String,
        totalTime: String,
        prepTime: String,
        cookTime: String,
        yields: String,
        feeds: String,
        ingredients: [Ingredient],
        steps: [Step],
        tags: [Tag]
    ) {
        
        let newRecipe = RecipePost(title: title,
                                   description: description,
                                   url: url, imgUrl: imgUrl,
                                   totalTime: totalTime,
                                   prepTime: prepTime,
                                   cookTime: cookTime, yields: yields,
                                   feeds: feeds, ingredients: ingredients,
                                   steps: steps, tags: tags)
    
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        guard let json = try? encoder.encode(newRecipe) else {
            print("Error encoding new recipe into json")
            return
        }
        
        let recipeReq = requestBuilder(recipesURL, resolvingAgianstBaseURL: true, method: HTTPMethod.post)!
        
        urlSessonUploadTaskBuilder(request: recipeReq, data: json)
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

func requestBuilder (
    _ url: URL,
    resolvingAgianstBaseURL: Bool = false,
    method: HTTPMethod = HTTPMethod.get
) -> URLRequest? {
    let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: resolvingAgianstBaseURL)
    
    guard let url = urlComponents?.url else {
        print("Error building request, url is nil")
        return nil
    }
    
    var req = URLRequest(url: url)
    req.httpMethod = method.rawValue
    
    req.setValue("application/json", forHTTPHeaderField: "Accept")
    if method == HTTPMethod.post || method == HTTPMethod.put {
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    return req
}

func urlSessonUploadTaskBuilder(request: URLRequest, data: Data, responseHandler: ((Data) -> Void)? = nil) {
    URLSession.shared.uploadTask(with: request, from: data) { resData, response, error in
        
        if let error = error {
            print("Server error; urlSessionUploadTaskBuilder() \n \(error)")
            return
        }
        
        guard let response = response as? HTTPURLResponse,
              (200...203).contains(response.statusCode)
        else {
            print("Server reponse error code: \(String(describing: response))")
            
            if let responseString = String(bytes: resData!, encoding: .utf8) {
                print(responseString)
            } else {
                print("Unable to encode response to valid String")
            }
            return
        }
        
        if let mimeType = response.mimeType,
            mimeType == "application/json",
            let data = resData,
            let responseHandler = responseHandler {
            responseHandler(data)
        }
    }
    .resume()
}
