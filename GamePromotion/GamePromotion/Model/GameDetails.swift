import Foundation

struct GameDetails : Codable {
    let title : String
    let year : String
    let website : String
    let description : String
    // let rating : String
    let poster :String
    let id: Int
    
    private enum CodingKeys : String, CodingKey{
        case title = "name"
        case year = "released"
        case website = "website"
        case description = "description"
        //    case rating = "rating"
        case poster = "background_image"
        case id = "id"
    }
}
