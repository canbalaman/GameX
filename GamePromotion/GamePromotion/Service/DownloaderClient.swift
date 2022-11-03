// Apiden Verileri indirdiğimiz yer
import Foundation
import SwiftUI

//clouser

class DownloaderClient{
    //  @escaping elemanı genellikle uygulamanın arka tarafında internet üzerinden veri çekmek için kullanılır eğer escaping kullanmasaydık bazı verilerin  geç gelmesi durumunda verilerimiz göstermesini beklerdi verilerimiz geç gelirdi
    func GameDownloader(search : String ,completion: @escaping (Result<[Game],Error>)->()){
        
        
       
       guard let url = URL(string: "https://api.rawg.io/api/games?key=a37bfe22bdfe43358212b79221115d33&search=\(search)")
        else {
            return
        }
        // urlSession.datatask  veriyi data formattında almak için kullanırız
        // urlrequest url  isteği
        // network isteğinden sonra closure isteği tetiklenecek
        URLSession.shared.dataTask(with: URLRequest(url: url)){data,_,error in
            guard let data = data,error == nil else {
               
                return
            }
            // do yapamazsa catch gitcek
            do {
                //JsonDecoder sınıfı ile  json verisini olduğunu bildiriyoruz
                // veriyi decode ediyoruz
                //Games.self Modeldeki verileri
                let gameCevap = try JSONDecoder().decode(Games.self, from: data)
               // print(gameCevap)
                // ----------olumlu olursa bura çalışacak -----------
                completion(.success((gameCevap.results)))
              //  print(gameCevap.results)
               
            }
           
            catch {
                completion(.failure(error))
               

            }
            
           //.resume olmazsa çalışmıyor
        }.resume()
    }
    func GameDetailsDownload(id:Int, Completion: @escaping (Result<GameDetails,Error>)-> ()){
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=a37bfe22bdfe43358212b79221115d33") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _,error in
            guard let data = data,error==nil else {
                return
                
            }
            do {
                let gelenGameDetails = try JSONDecoder().decode(GameDetails.self , from :data)
                print(gelenGameDetails)
                Completion(.success((gelenGameDetails)))
            }
            catch {
                Completion(.failure(error))
            }
           
        }.resume()
    }
}
