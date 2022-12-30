import Foundation
import SwiftUI

class GameListVM : ObservableObject{

    // ObservableObject değişekenler üzerinde olan her değişikliği nesneler üzerine yeniden yükler
    @Published var games=[GameViewModel]()
    // Published Yeniden yüklemesini ve tetiklemesini söyleyen
    let downloaderClient = DownloaderClient()
    
    func GameSearch(gameName:String){
        downloaderClient.GameDownloader(search: gameName) { sonuc in
            switch sonuc{
            case.failure(let hata):
                print(hata)
            case.success(let gameArray):
                DispatchQueue.main.async {
                    //main üzerindeki thread asenkron olarak çalışır
                    self.games=gameArray.map(GameViewModel.init)
                   
                    // veriler dizi şeklinde olduğu için mapladık
                }
                
                }
            }
        }
    }
// Gösterilecek model
struct GameViewModel{
  
    let game : Game
    
    var name : String {
        game.name
    }
    var poster : String {
        game.poster
        }
    
    var Id: Int{
        game.id
    }
    
    
}
