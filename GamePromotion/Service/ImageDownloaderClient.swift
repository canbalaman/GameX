//
//  ImageDownloaderClient.swift
//  GamePromotion
//
//  Created by Can Balaman on 24.10.2022.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
 @Published   var DownloadBackground : Data?
    
    func DownloadImage(url :String){
        guard let imageUrl = URL(string: url ) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data,error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.DownloadBackground = data
            }
           
        }
    }
}
