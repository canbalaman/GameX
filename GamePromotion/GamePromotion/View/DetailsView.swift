import SwiftUI
import Kingfisher

struct DetailsView: View {
    
    let id : Int
    // observedobject bir değişkeni depolamak ve diğer viewlar arasında değişimleri otamatık taşır
    @ObservedObject var gameDetayViewModel = GameDetailsViewModel()
    var body: some View {
        VStack{
        //    PublicImage(url: gameDetayViewModel.GameDetayi?.poster ?? "Image Gelecek")
            KFImage(URL(string: gameDetayViewModel.GameDetayi?.poster ?? "Image"))
                .resizable()
                .frame(width: 300,height: 450,alignment: .top).padding()
            Text(gameDetayViewModel.GameDetayi?.title ?? "").font(.title2).padding()
        
            Text(gameDetayViewModel.GameDetayi?.description ?? "Detay gelecek").padding()
            Text(" Release Year  \(gameDetayViewModel.GameDetayi?.year ?? "Yıl Gelecek")").padding()
            Text("Web Page \(gameDetayViewModel.GameDetayi?.website ?? "WebSite gelecek")")
        }.onAppear(perform : {
            self.gameDetayViewModel.GameDetailsGo(id:id)
        })
        //onAppear içerisine yazdığınız kod parçaları kendisine uyguladığınız görünüm ekranda görünür hale geldiğinde çalıştırılıyor.
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: 3328)
        // Denemek için id
    }
}
