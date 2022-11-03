import SwiftUI

struct DetailsView: View {
    
    let id : Int
    // observedobject bir değişkeni depolamak ve diğer viewlar arasında değişimleri otamatık taşır
    @ObservedObject var gameDetayViewModel = GameDetailsViewModel()
    var body: some View {
        VStack{
        //    PublicImage(url: gameDetayViewModel.GameDetayi?.poster ?? "Image Gelecek")
            Image("placeholder2").resizable().frame(width: 250, height: 300, alignment: .top).padding()
            Text(gameDetayViewModel.GameDetayi?.title ?? "İsmi gelecek").font(.title2).padding()
            Text(gameDetayViewModel.GameDetayi?.description ?? "Detay gelecek").padding()
            Text(" Çıkış Yılı  \(gameDetayViewModel.GameDetayi?.year ?? "Yıl Gelecek")").padding()
            Text("Web Site \(gameDetayViewModel.GameDetayi?.website ?? "WebSite gelecek")")
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
