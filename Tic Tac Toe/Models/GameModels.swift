//
//  GameModels.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 21/03/23.
//

import UIKit

enum GameType{
    case single, bot, peer, undertemined
    
    var description: String{
        switch self {
        case .single:
            return "Share your iPhone/iPad and play against a friend"
        case .bot:
            return "Play against this iPhone/iPad."
        case .peer:
            return "Invite someone near you who has this app running to play"
        case .undertemined:
            return ""
        }
    }
}
enum GamePiece: String{
    case x,o
    var image : Image{
        image(self.rawValue)
    }
}

struct Player{
    let gamePiece: GamePiece
    var name: String
    var moves: [Int] = []
    var isCurrent = false
    var isWinner : Bool{
        for moves in Move.winningMoves{
            if moves.allSatisfy(self.moves.contains){
                return true
            }
        }
        return false
    }
}
enum Move{
    static var all = [1,2,3,4,5,6,7,8,9]
    static var winningMoves = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
}