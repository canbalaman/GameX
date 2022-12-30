import Foundation
import SwiftUI

class GameDetailsViewModel : ObservableObject {
    
    // ObservableObject değişekenler üzerinde olan her değişikliği nesneler üzerine yeniden yükler
    @Published var GameDetayi : GameDetailsModelViewModels?
    // Published Yeniden yüklemesini ve tetiklemesini söyleyen
    let downloaderClient = DownloaderClient()
    //Listden gelen id bilgisini alıyor
    func GameDetailsGo(id :Int){
        downloaderClient.GameDetailsDownload(id:id) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case .success(let gameDetay):
                
                self.GameDetayi = GameDetailsModelViewModels(detay: gameDetay)
                
            }
        }
    }
    
}
// Gösterilecek model
struct GameDetailsModelViewModels {
    let detay : GameDetails
    var title : String{
        detay.title
    }
    var poster : String{
        detay.poster
    }
    var year : String {
        detay.year
    }
    var id : Int {
        detay.id
    }
    var website : String {
        detay.website
    }
    var description : String {
        detay.description
    }
  //  var rating : String {
    //    detay.rating
   //  }
}
