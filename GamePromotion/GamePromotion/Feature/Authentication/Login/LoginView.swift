import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            
            Image("ımg_x").resizable().frame(width: 300 ,height: 300,alignment: .top)
            Text("Welcome")
            VStack {
                TextField("Write Your email",text: $email).keyboardType(.emailAddress).padding()
            }
            
            VStack {
                TextField("Write Your Password",text: $password).padding()
            }
            
            HStack{
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                }
                Button {
                    
                } label: {
                    Text("Log In")
                }

            }
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
                print("Giriş Başarılı")
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
