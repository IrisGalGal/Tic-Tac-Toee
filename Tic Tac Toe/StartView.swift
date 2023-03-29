//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 17/03/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var game: GameService
    @State private var gameType: GameType = .undertemined
    @AppStorage("yourName") var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    @State private var changeName = false
    @State private var newName = ""
    init(yourName: String){
        self.yourName = yourName
    }
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
                        TextField("Your opponent name", text: $opponentName)
                    }
                case .bot:
                    VStack{
                        EmptyView()
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
                    game.setupGame(gameType: gameType, player1Name: yourName, player2Name: opponentName)
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undertemined || gameType == .single && opponentName.isEmpty
                )
                Image("LaunchScreen")
                Text("Your name is \(yourName)")
                Button("Change my name"){
                    changeName.toggle()
                }
                .buttonStyle(.bordered)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("TIC TAC TOE")
        .fullScreenCover(isPresented: $startGame, content: {
            GameView()
        })
        .alert("Change Name",isPresented: $changeName, actions: {
            TextField("New name", text: $newName)
            Button("Ok", role: .destructive){
                yourName = newName
                exit(-1)
            }
            Button("Cancel", role: .cancel){}
        }, message: {
            Text("Tapping on the Ok button will quit the application so you can relaunch to use your change")
        } )
        .inNavigationStack()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(yourName: "Smb")
            .environmentObject(GameService())
    }
}
