import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack{
            
            Image("ımg_x").resizable().frame(width: 300 ,height: 300,alignment: .top)
            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            NavigationView{
                Button {
                   
                } label: {
                    HStack{
                        Image(systemName:"envelope.badge.fill").resizable().frame(width: 32,height: 32).foregroundColor(.white)
                       
                        Text("Sign in Mail")
                            .font(.title2)
                            
                            .foregroundColor(.white)
                        Spacer()
                        
                    }
                    .padding()
                    .background(.purple)
                    
                }.buttonStyle(.borderless)
                    
                
                
                
            }
        }
    }
    }


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
