//
//  ContentView.swift
//  GamePromotion
//
//  Created by Can Balaman on 13.10.2022.
//

import SwiftUI

struct GameListView: View {
   @ObservedObject var gameListViewModel :GameListVM
    
    init (){
        self.gameListViewModel = GameListVM()
        self.gameListViewModel.GameSearch(gameName: "forest")
    }
    var body: some View {
        List(gameListViewModel.games, id: \.Id){
            game in  Text(game.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
