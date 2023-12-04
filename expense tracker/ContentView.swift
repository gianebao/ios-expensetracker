//
//  ContentView.swift
//  expense tracker
//
//  Created by Gian Carlo Val Ebao on 11/30/23.
//  AppIcon using icon.kitchen
//  Full list of icons https://hotpot.ai/free-icons?s=sfSymbols
//

import SwiftUI
import CurrencyField

struct ContentView: View {

    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    
    @State private var date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
    @State private var amount = 0
    @FocusState private var isAmountFocused: Bool
    
    @State private var image = UIImage()
    @State private var showSheet = false
            
    var body: some View {
        ScrollView {
            VStack {
                Section {
                    DatePicker("Date Issued", selection: $date, displayedComponents: [.date])
                        .textCase(nil)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                Section ("Take a photo of the receipt") {
                    HStack{
                        Spacer()
                           
                        Image(uiImage: self.image)
                            .resizable()
                            .cornerRadius(5)
                            .frame(width: 200, height: 200)
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal, 10)
                            
                        Spacer()
                    }
                    .background(Color.black.opacity(0.2))
                    HStack{
                        Spacer()
                        Button(action: {
                            showSheet = true
                            isAmountFocused = false
                        }) {
                            Image(systemName: "camera.viewfinder")
                                .resizable()
                                .frame(width: 23.0, height: 23.0)
                        }
                        .padding()
                        .background(.pink)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .buttonStyle(.borderless)
                        .contentShape(Circle())
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
                .textCase(nil)
                .padding(.horizontal, 20)
                
                
                .frame(maxWidth: .infinity, alignment: .leading)
            
                
                Section ("Amount") {
                        CurrencyField(value: $amount)
                            .foregroundColor(Color.primary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.system(size: 25))
                            .focused($isAmountFocused)
                }
                .textCase(nil)

                .padding(.horizontal, 20)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                HStack {
                    Button(action: {
                        print("Submit")
                        isAmountFocused = false
                    }, label: {
                        Text("Submit")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(7)
                        })
                    .tint(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, 30)
                .sheet(isPresented: $showSheet){
                    // ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
            } // VStack
            .foregroundColor(.brown)
            .tint(.pink)
            .padding()
        }
        .scrollDismissesKeyboard(.interactively)
    }
        .alert(

}

#Preview {
    ContentView()
}
