import SwiftUI

struct GameListView: View {
    // observedobject bir değişkeni depolamak ve diğer viewlar arasında değişimleri otamatık taşır
   @ObservedObject var gameListViewModel :GameListVM
    //State sadecebu bu viewde çalışır
    @State var SearchGame=""
    
    init (){
        self.gameListViewModel = GameListVM()
        
    }
    var body: some View {
        NavigationView{
            //Dikey
            VStack(){
            TextField("Aranacak Kelime", text:$SearchGame) {
                self.gameListViewModel.GameSearch(gameName: SearchGame)
            }.padding()
        List(gameListViewModel.games, id: \.Id){
            game in
             //Listedeki tıkladığımız alanın id sini Details view gönderiyor
            NavigationLink {
                DetailsView(id: game.Id)
            } label: {
                //Yatay
                HStack() {
                 //   PublicImage(url: game.poster)
                Image("placeholder2").resizable().frame(width:90,height: 120)
                  
                    VStack(){
                        Text(game.name).foregroundColor(.blue)
                        
                    }
                    
                }
            }

           
        }.navigationTitle(Text("Oyunlar"))
                    .navigationBarTitleDisplayMode(.inline)
    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
