//
//  YourNameView.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 29/03/23.
//

import SwiftUI

struct YourNameView: View {
    @AppStorage("yourName") var yourName = ""
    @State private var userName = ""
    var body: some View {
        VStack{
          Text("This is the name that will be associated wit this device.")
            TextField("Your Name", text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("set"){
                yourName = userName
            }
            .buttonStyle(.borderedProminent)
            .disabled(userName.isEmpty)
            Image("LaunchScreen")
            Spacer()
        }
        .padding()
        .navigationTitle("TIC TAC TOE")
        .inNavigationStack()
    }
}

struct YourNameView_Previews: PreviewProvider {
    static var previews: some View {
        YourNameView()
    }
}
