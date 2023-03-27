//
//  GameView.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 26/03/23.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Hello, World")
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("End Game"){
                    dismiss()
                    
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("TIC TAC TOE")
        .inNavigationStack()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
