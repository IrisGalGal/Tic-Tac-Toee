//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 17/03/23.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undertemined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undertemined)
                Text("Two Sharing device").tag(GameType.single)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challenge a friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            .accentColor(.primary)
            Text(gameType.description)
                .padding()
            VStack{
                switch gameType{
                case .single:
                    VStack{
                        TextField("Your name", text: $yourName)
                        TextField("Your opponent name", text: $opponentName)
                    }
                case .bot:
                    VStack{
                        TextField("Your name", text: $yourName)
                    }
                case .peer:
                    VStack{
                        EmptyView()
                    }
                case .undertemined:
                    VStack{
                        EmptyView()
                    }
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            if gameType != .peer{
                Button("Start Game"){
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undertemined || gameType == .bot && yourName.isEmpty || gameType == .single && (yourName.isEmpty && opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("TIC TAC TOE")
        .fullScreenCover(isPresented: $startGame, content: {
            GameView()
        })
        .inNavigationStack()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}