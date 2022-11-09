import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack{
            
            Image("ımg_x").resizable().frame(width: 300 ,height: 300,alignment: .top)
            Button {
                
            } label: {
                HStack{
                    Image("ic_facebook").resizable().frame(width: 60,height: 60)
                    Text("Sign in With Facebook")
                    Spacer()
                    
                }
                .background(.white)
            }.buttonStyle(.bordered)
                

        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
