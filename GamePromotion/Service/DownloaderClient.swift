import Foundation
import SwiftUI


class DownloaderClient{
    
    func GameDownloader(search : String ,completion: @escaping (Result<[Game],Error>)->()){
        
        
       
       guard let url = URL(string: "https://api.rawg.io/api/games?key=a37bfe22bdfe43358212b79221115d33")
        else {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)){data,_,error in
            guard let data = data,error == nil else {
               
                return
            }
            do {
                let gameCevap = try JSONDecoder().decode(Games.self, from: data)
                print(gameCevap)
                completion(.success((gameCevap.results)))
               
            }
           
            catch {
                completion(.failure(error))
               

            }
            
           
        }.resume()
    }
}

    


enum DownloaderError: Error {
    
    case wrongUrl
    case noData
    case dataNotProcessed
}

