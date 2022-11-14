import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack{
            
            Image("ımg_x").resizable().frame(width: 300 ,height: 300,alignment: .top)
            Button {
                
                
            } label: {
                HStack{
                    Image("star.fill").resizable().frame(width: 48,height: 48)
                    Text("Sign in Mail").foregroundColor(.white)
                    Spacer()
                    
                }
                .background(.orange)
            }.buttonStyle(.borderless)
        }
                

        }
    }


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

