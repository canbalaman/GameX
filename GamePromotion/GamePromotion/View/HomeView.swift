
import SwiftUI

struct HomeView: View {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    var body: some View {
        
        TabView{
            
            SettingView(DarkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled)
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
            
        }.onAppear{
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
