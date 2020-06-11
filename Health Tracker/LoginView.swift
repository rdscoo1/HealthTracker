//
//  LoginView.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isTextFieldFocused = false
    @State var showAlert = false
    @State var alertMessage = LocalizedStringKey("Something went wrong")
    @State var isLoading = false
    @State var isSuccess = false
    
    func login() {
        self.hideKeyboard()
        self.isTextFieldFocused = false
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.isSuccess = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.email = ""
                self.password = ""
                self.isSuccess = false
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color("background")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("Your Email", text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isTextFieldFocused = true
                        }
                    }
                    
                    Divider()
                        .padding(.leading, 80)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        
                        SecureField(LocalizedStringKey("Password"), text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isTextFieldFocused = true
                        }
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 460)
                
                HStack {
                    Text(LocalizedStringKey("Forgot password?"))
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {
                        self.login()
                    }) {
                        Text(LocalizedStringKey("Log in"))
                            .foregroundColor(.black)
                    }
                    .padding(12)
                    .padding(.horizontal, 30)
                    .background(Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                
            }
            .offset(y: isTextFieldFocused ? -300 : 0)
            .animation(isTextFieldFocused ? .easeInOut : nil)
            .onTapGesture {
                self.isTextFieldFocused = false
                self.hideKeyboard()
            }
            
            if isLoading {
                LoadingView()
            }
            if isSuccess {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            LottieViewLooped()
                .frame(width: 300, height: 250)
                .animation(Animation.linear(duration: 1).delay(0.4))
        
                Text(LocalizedStringKey("Your health\nOur care"))
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: 375, maxHeight: 250, alignment: .leading)
                    .padding(.horizontal, 16)
                    .offset(x: viewState.width/15, y: viewState.height/15)
        }
        .frame(height: 400)
        .background(Color.white)
        .cornerRadius(30)
        .modifier(ShadowModifier())
        .scaleEffect(isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .rotation3DEffect(.degrees(10), axis: (x: viewState.width, y: viewState.height, z: 0))
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
                self.isDragging = true
            }
            .onEnded { value in
                self.viewState = .zero
                self.isDragging = false
            }
        )
    }
}
