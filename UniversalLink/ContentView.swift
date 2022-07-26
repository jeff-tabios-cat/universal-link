//
//  ContentView.swift
//  UniversalLink
//
//  Created by Jeffrey Tabios on 7/15/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var phone = "+19482840294"
    @State var success = ""
    @State var error = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Send SMS to login:")
            TextField("+639175361205", text: $phone)
                .padding(5)
                .frame(width: 200)
                .border(.blue, width: 2)
            HStack {
                Button(action: {
                    PhoneAuthProvider.provider()
                      .verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
                          if let error = error {
                              self.error = error.localizedDescription
                            return
                          }
                          self.success = "SUCCESS"
                      }
                }) {
                    Text("Send SMS")
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(14)
                        
                }
                
                Button(action: {
                    self.success = ""
                    self.error = ""
                }) {
                    Text("Reset")
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(14)
                        
                }
            }
            Text(error)
                .foregroundColor(.red)
            Text(success)
                .foregroundColor(.blue)
            Spacer()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
