import SwiftUI
import Kingfisher
import Firebase

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
            VStack{
                HStack{
                    //Search Bar
                    TextField("Search", text:$SearchGame)
                    {
                        self.gameListViewModel.GameSearch(gameName: SearchGame.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) ?? SearchGame)
                    }.padding(.leading,24)
                    
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(112)
                        .padding(.horizontal)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                Button {
                                    SearchGame=""
                                } label: {
                                    Image(systemName: "xmark.circle.fill" )
                                        .padding(.vertical)
                                }
                                
                            }
                                .padding(.horizontal,32)
                                .foregroundColor(.blue)
                        )
                    Spacer()
                }
                
                
                List(gameListViewModel.games, id: \.Id){
                    game in
                    //Listedeki tıkladığımız alanın id sini Details view gönderiyor
                    NavigationLink {
                        DetailsView(id: game.Id)
                    } label: {
                        //Yatay
                        HStack() {
                            
                            KFImage(URL(string:game.poster)!)
                                .resizable().frame(width:90,height: 120)
                            VStack{
                                Text(game.name).foregroundColor(.blue)
                                
                            }
                            
                        }
                    }
                    
                    
                }.navigationTitle(Text("Game"))
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
