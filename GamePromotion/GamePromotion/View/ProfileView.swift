//
//  ProfileView.swift
//  GamePromotion
//
//  Created by Can Balaman on 11.12.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            VStack{
                Image("x1024").resizable()
                    .frame(width: 120,height: 120).clipShape(Circle())
                Text("Can Balaman").font(.title).bold()
            }
            Spacer().frame(height: 30)
            VStack(alignment: .leading,spacing:12){
                HStack{
                    Image(systemName: "envelope")
                    Text("Mymailadress")
                }
                
            }
            SettingView()
                
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
