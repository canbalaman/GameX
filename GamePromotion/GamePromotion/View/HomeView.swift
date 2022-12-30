
import SwiftUI

struct HomeView: View {
   
    var body: some View {
        
        TabView{
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
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
                    Text("Favorite")
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
