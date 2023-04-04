//
//  AuthenticationViewModel.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/22/23.
//

import SwiftUI
import Combine
import GoogleSignIn

final class AuthenticationViewModel: ObservableObject {
    
    @Published var signInState: SignInState
    
    init() {
        if let user = GIDSignIn.sharedInstance.currentUser {
            self.signInState = .signedIn(user)
        } else {
            self.signInState = .signedOut
        }
    }
    
    func signIn() {
        /// set root view controller
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("No root view controller!")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            /// make sure sign in was successful
            guard let result = signInResult else {
                print("Error! \(String(describing: error))")
                return
            }
            
            /// ensure token is fresh
            result.user.refreshTokensIfNeeded { user, error in
                guard let user = user else {
                    print("Error! \(String(describing: error))")
                    return
                }
                
                /// prepare json data for user service's token_login endpoint
                guard let json = try? JSONEncoder().encode( ["idToken" : user.idToken?.tokenString] ) else {
                    print("Error encoding JSON item; \n")
                    dump(result)
                    return
                }
                
                /// build URLRequest
                let url = URL(string: URLCONSTANTS.signIn)!
                var req = requestBuilder(url, method: .post)!
                
                urlSessonUploadTaskBuilder(request: req, data: Data(json), responseHandler: AuthenticationViewModel.setAuthTokenInUserDefaults)
                
                self.signInState = .signedIn(result.user)
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.signInState = .signedOut
    }
    
    func disconnect() {
        GIDSignIn.sharedInstance.disconnect { error in
            if let error = error {
                print("Disconnection Error!!!! \(String(describing: error))")
            }
            self.signOut()
        }
    }
    
    
    
    
    private var requestCancellanble: AnyCancellable?
    
    func testSend() {
        let url = URL(string: "http://127.0.0.1:5000/users/")!
//        let url = URL(string: "http://192.168.1.204:8080/users/")!
        requestCancellanble?.cancel()
        
        let req = AuthenticationViewModel.authRequestBuilder(url: url)
        
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: req!)
            .map { (data, urlResponse) -> String? in
                return String(data: data, encoding: .utf8)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
        
        requestCancellanble = publisher
            .sink { [weak self] str in
                print("test is complete!!! \(str ?? "no string found")")
            }
    }
    
    
    
    static func setAuthTokenInUserDefaults(responseData: Data) {
        do {
            let token = try JSONDecoder().decode(TokenResponse.self, from: responseData)
            UserDefaults.standard.set(token.token, forKey: "AuthToken")
        } catch {
            print("Error decoding request into instance of TokenResponse: \(error)")
        }
    }
    
    static func getAuthTokenFromUserDefaults() {
        UserDefaults.standard.string(forKey: "AuthToken")
    }
    
    static func authRequestBuilder(url: URL, method: HTTPMethod = .get) -> URLRequest? {
        var req = requestBuilder(url, resolvingAgianstBaseURL: true, method: method)
        let token = UserDefaults.standard.string(forKey: "AuthToken")
        print(token)
        req?.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        return req
    }
}

extension AuthenticationViewModel {
    enum SignInState {
        case signedIn(GIDGoogleUser)
        case signedOut
    }
}

struct URLCONSTANTS {
    static let signIn = "http://127.0.0.1:5000/token_login"
//    static let signIn = "http://192.168.1.204:8080/token_login"
    static let userBase = "http://127.0.0.1:5000"
    static let invBase = "http://127.0.0.1:2023"
}

struct TokenResponse: Codable {
    let token: String
}
