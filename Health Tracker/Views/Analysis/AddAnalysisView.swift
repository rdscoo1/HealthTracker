//
//  AddAnalysisView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 11.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI
import Combine

struct AddAnalysisView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var isTextFieldFocused = false
    @State var offsetValue: CGFloat = 0
    @State var showAlert = false
    
    @State var glucose: String = ""
    @State var cholesterol: String = ""
    @State var hemoglobin: String = ""
    
    func keyboardNotification() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main) { (notification) in
                let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.isTextFieldFocused = true
                self.offsetValue = height
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main) { _ in
                self.isTextFieldFocused = false
                self.offsetValue = 0
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("AnalysisIllustration")
                        .resizable()
                        .frame(width: 256, height: 224)
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                        .offset(y: isTextFieldFocused ? -100 : 0)
                        .animation(.easeInOut)
                    
                    VStack {
                        HStack {
                            Text("Глюкоза")
                                .font(.system(size: 22, weight: .medium))
                            
                            Spacer()
                            
                            TextField("0", text: self.$glucose)
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center)
                                .frame(height: 44)
                                .frame(maxWidth: 72)
                                .background(BlurView(style: .systemMaterial))
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                                .keyboardType(.numberPad)
                                .onReceive(Just(glucose)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.glucose = filtered
                                    }
                            }
                            .onTapGesture {
                                self.isTextFieldFocused = true
                            }
                            .onAppear {
                                self.keyboardNotification()
                            }
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Гемоглобин")
                                .font(.system(size: 22, weight: .medium))
                            
                            Spacer()
                            
                            TextField("0", text: self.$hemoglobin)
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center)
                                .frame(height: 44)
                                .frame(maxWidth: 72)
                                .background(BlurView(style: .systemMaterial))
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                                .keyboardType(.numberPad)
                                .onReceive(Just(hemoglobin)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.hemoglobin = filtered
                                    }
                            }
                            .onTapGesture {
                                self.isTextFieldFocused = true
                            }
                            .onAppear {
                                self.keyboardNotification()
                            }
                        }
                        .padding(.bottom, 16)
                        
                        
                        HStack {
                            Text("Холестерин")
                                .font(.system(size: 22, weight: .medium))
                            
                            Spacer()
                            
                            TextField("0", text: self.$cholesterol)
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center)
                                .frame(height: 44)
                                .frame(maxWidth: 72)
                                .background(BlurView(style: .systemMaterial))
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                                .keyboardType(.numberPad)
                                .onReceive(Just(cholesterol)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.cholesterol = filtered
                                    }
                            }
                            .onTapGesture {
                                self.isTextFieldFocused = true
                            }
                            .onAppear {
                                self.keyboardNotification()
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    .padding(.horizontal, 32)
                    
                    
                    Spacer()
                    
                    Button(action: {
                        let iscorrectGlucose = Helper.instance.checkTextField(text: self.glucose,
                                                                              minValue: Constants.AnalysisLimit.minValue,
                                                                              maxValue: Constants.AnalysisLimit.maxDefault)
                        let iscorrectHemoglobin = Helper.instance.checkTextField(text: self.hemoglobin,
                                                                                 minValue: Constants.AnalysisLimit.minValue,
                                                                                 maxValue: Constants.AnalysisLimit.maxDefault)
                        let iscorrectCholesterol = Helper.instance.checkTextField(text: self.cholesterol,
                                                                                  minValue: Constants.AnalysisLimit.minValue,
                                                                                  maxValue: Constants.AnalysisLimit.maxDefault)
                        guard iscorrectGlucose, iscorrectHemoglobin, iscorrectCholesterol else {
                            self.showAlert.toggle()
                            return
                        }
                        
                        let newAnalysis = Analysis(context: self.managedObjectContext)
                        newAnalysis.glucose = self.glucose
                        newAnalysis.hemoglobin = self.hemoglobin
                        newAnalysis.cholesterol = self.cholesterol
                        newAnalysis.createdAt = Date()
                        print("Новый замер: ", newAnalysis)
                        
                        try? self.managedObjectContext.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Сохранить")
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 96)
                    }
                    .background(Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                    .padding(.bottom, 16)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Ошибка ввода"), message: Text("Пожалуйста, введите корректные значения!"), dismissButton: .default(Text("OK")))
                    }
                }
                .offset(y: -self.offsetValue)
                .animation(.spring())
                .onTapGesture {
                    self.isTextFieldFocused = false
                    self.hideKeyboard()
                }
                    
                    
                .navigationBarTitle(Text("Добавить анализ"))
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.white)
                        .frame(width: 36, height: 36)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .padding(.top, 8)
                })
            }
        }
    }
}

struct AddAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnalysisView()
    }
}
