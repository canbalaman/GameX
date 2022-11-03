import Foundation
// ObservableObject değişekenler üzerinde olan her değişikliği nesneler üzerine yeniden yükler
class ImageDownloaderClient : ObservableObject{
  // Published Yeniden yüklemesini ve tetiklemesini söyleyen
 // örnek olarakda kullanıcı ayarlarını değiştirde her zaman o ayarlarda kalması
 @Published var DownloadBackground : Data?
    
    func DownloadImage(url: String){
        guard let imageUrl = URL(string: url ) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (data, _ , error) in
            guard let data = data,error == nil else {
                return
            }
            //gelen veri büyük olunca uygulamanın donmaması için başke threadlerde çalıştırabiliyoruz
            //main üzerindeki thread asenkron olarak çalışır
            DispatchQueue.main.async {
                self.DownloadBackground = data
            }
           
        }.resume()
    }
}
