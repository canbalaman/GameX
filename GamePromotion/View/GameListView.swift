//
//  ContentView.swift
//  GamePromotion
//
//  Created by Can Balaman on 13.10.2022.
//

import SwiftUI

struct GameListView: View {
   @ObservedObject var gameListViewModel :GameListVM
    @State var SearchGame=""
    
    init (){
        self.gameListViewModel = GameListVM()
        
    }
    var body: some View {
        NavigationView{
            VStack{
            TextField("Aranacak Kelime", text:$SearchGame) {
                self.gameListViewModel.GameSearch(gameName: SearchGame)
            }.padding()
        List(gameListViewModel.games, id: \.Id){
            game in
            HStack{
                Image("placeholder2").resizable().frame(width: 90, height: 130)
                   
                VStack{
                    Text(game.name).foregroundColor(.blue)
                    
                }
            }
        
        }.navigationTitle(Text("Oyunlar"))
    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
