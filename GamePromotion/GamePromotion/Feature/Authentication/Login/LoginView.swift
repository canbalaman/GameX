import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
       
        
        VStack{
            
            Image("ımg_x").resizable().frame(width: 300 ,height: 300,alignment: .top).foregroundColor(.white)
            
            VStack {
                TextField("Write Your email",text: $email).keyboardType(.emailAddress).padding().foregroundColor(.white)
            }
            
            VStack {
                TextField("Write Your Password",text: $password).padding()
            }
            
            HStack{
                Button {
                    register()
                } label: {
                    HStack{
                        //Image(systemName: "")
                        Text("Sign Up").foregroundColor(.white)
                    }
                    
                }
                
                
                // Login Button
                Button {
                    login()
                } label: {
                    HStack{
                      //  Image(systemName: "")
                        Text("Log In").foregroundColor(.white)
                    }
                   
                }
                

            }.buttonStyle(.borderless).background(.purple)
            
        }
       
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result , error in
            if let error = error {
                
            }
            else {
                print("Üye olma başarılı")
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result , error in
            if let error = error {
                
            }
            else {
               
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
