import SwiftUI
import Kingfisher

struct DetailsView: View {
    
    let id : Int
    // observedobject bir değişkeni depolamak ve diğer viewlar arasında değişimleri otamatık taşır
    @ObservedObject var gameDetayViewModel = GameDetailsViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 36.0){
                HStack(alignment: .top, spacing: 24.0)
                {
                    KFImage(URL(string: gameDetayViewModel.GameDetayi?.poster ?? ""))
                        .resizable()
                        .frame(width: 150,height: 237)
                        .shadow(color:.gray,radius: 10, x:5,y:5)
                    
                    
                    VStack(alignment: .leading,spacing: 8.0){
                        HStack(alignment: .top){
                            VStack(alignment:.leading ,spacing: 8.0){
                                HStack{
                                    Image(systemName:"calendar.badge.clock")
                                    Text(gameDetayViewModel.GameDetayi?.year ?? "")
                                }
                                HStack{
                                    Image(systemName: "globe")
                                    Text(gameDetayViewModel.GameDetayi?.website ?? "No Website")
                                }
                                
                               
                            }.font(.callout)
                                .foregroundColor(.secondary)
                                .padding(.top ,6)
                            Spacer()
                            
                        }
                    }
                }.padding(.top,18)
                    .padding(.horizontal,20)
            }
           
            VStack{
              
                Text(gameDetayViewModel.GameDetayi?.title ?? "").font(.title2).padding()
                
                Text(gameDetayViewModel.GameDetayi?.description ?? "").padding()
               
                
            }.onAppear(perform : {
                self.gameDetayViewModel.GameDetailsGo(id:id)
            })
            //onAppear içerisine yazdığınız kod parçaları kendisine uyguladığınız görünüm ekranda görünür hale geldiğinde çalıştırılıyor.
            
        }
    }
}
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: 3328)
        // Denemek için id
    }
}
