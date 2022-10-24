import SwiftUI

struct PublicImage: View {
    let url :String
    @ObservedObject var imageDownloaderClient
    = ImageDownloaderClient()
    init (url :String){
        self.url=url
        self.imageDownloaderClient.DownloadImage(url: self.url)
    }
    var body: some View {
        if let data =
            self.imageDownloaderClient.DownloadBackground{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        else {
            return Image("placeholder2").resizable()
        }
    }
}

struct PublicImage_Previews: PreviewProvider {
    static var previews: some View {
        PublicImage(url: "https://media.rawg.io/media/games/1be/1be575aa6de86de328433a63fb534d9a.jpg")
    }
}

