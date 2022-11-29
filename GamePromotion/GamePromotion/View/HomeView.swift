//
//  HomeView.swift
//  GamePromotion
//
//  Created by Can Balaman on 25.11.2022.
//

import SwiftUI

struct HomeView: View {
   
    var body: some View {
        
        TabView{
            
           // GameListView()
            Text("Profile")
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            //Game
           
            SettingView()
                .tabItem{
                    Image(systemName: "gear.circle.fill")
                    Text("Settings")
                }
            
            //Game
            GameListView()
                .tabItem{
                    Image(systemName: "gamecontroller.fill")
                    Text("Games")
                }
            //Favori
            Text("Favori")
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Favori")
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
