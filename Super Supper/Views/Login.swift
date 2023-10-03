//
//  Login.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/22/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct Login: View {
    @ObservedObject var gvm = GoogleSignInButtonViewModel(scheme: .dark ,style: .wide, state: .normal)
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .fill()
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("C4")/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .fill(.white)
                    .frame(width: 250, height: 250)
                Rectangle()
                    .fill(.clear)
                    .frame(width: 175, height: 175)
                    .border(.black)
                Rectangle()
                    .fill(.clear)
                    .frame(width: 150, height: 150)
                    .border(.black)
                Rectangle()
                    .fill(.clear)
                    .frame(width: 150, height: 150)
                    .border(.black)
                    .rotationEffect(Angle(degrees: 45))
            
                
                Text("SUPER \nSUPPER \nLOGO HERE")
            }
            VStack {
                Button(action: {} ) {
                    GoogleSignInButton(viewModel: gvm, action: authVM.signIn )
                }
                Button(action: {}) {
                    ZStack {
                        Rectangle()
                            .fill()
                        .frame(height: 50)
                        Text("Sign-in with Apple")
                            .foregroundColor(.white)
                    }
                }
                Button(action: {}) {
                    ZStack {
                        Rectangle()
                            .fill()
                        .frame(height: 50)
                        Text("Sign-in with \"FaceBook\"")
                            .foregroundColor(.white)
                    }
                }
                Button("Continue as guest") {
                    ///
                }
            }
            
            Spacer()
            
        }
        .padding()
        .background(/*@START_MENU_TOKEN@*/Color("C3")/*@END_MENU_TOKEN@*/)
    }
    
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(AuthenticationViewModel())
    }
}
