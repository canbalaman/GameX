// Listeleme İçin model yapısı
import Foundation

struct Games: Codable{
    let results : [Game]
}
// Decoable json dilinde gelen veriyi swift diline çevirmek için
// Encodable  swift deki verileri json çevirir
// Codable Encodeble + Decodable
struct Game : Codable{
    
    
    let id : Int
    let name : String
    let backgroundImage: String?
    }


// CodingKey kullandığınız API’ın özellikleri, isimlendirme prensiplerinize uymayan isimlere sahipse modeliniz isimleri de öyle olmak zorunda kalır. Bu yüzden kodunuzun kalitesi düşebilir. Bunun olmaması için CodingKeys yapısını kullanırız.
enum CodingKeys: String, CodingKey {
    case id,name
    case backgroundımage = "background_image"
    
}



