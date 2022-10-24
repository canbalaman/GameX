import Foundation
import SwiftUI

class GameListVM : ObservableObject{
    
    @Published var games=[GameViewModel]()
    let downloaderClient = DownloaderClient()
    func GameSearch(gameName:String){
        downloaderClient.GameDownloader(search: gameName) { sonuc in
            switch sonuc{
            case.failure(let hata):
                print(hata)
            case.success(let gameArray):
                DispatchQueue.main.async {
                    self.games=gameArray.map(GameViewModel.init)
                }
                
                }
            }
        }
    }
struct GameViewModel{
    let game : Game
    
    var name : String {
        game.name
    }
//    var poster :String{
  //      game.backgroundImage
  //  }
    var Id: Int{
        game.id
    }
    
}
