//
//  MPGameMove.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 30/03/23.
//

import Foundation
struct MPGameMove: Codable{
    enum Action: Int, Codable{
        case start, move, reset, end
    }
    let action: Action
    let playerName: String?
    let index: Int?
    func data() -> Data?{
        try? JSONEncoder().encode(self)
    }
}
