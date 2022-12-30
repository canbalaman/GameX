import SwiftUI
import Firebase


@available(iOS 16.0, *)
struct LoginView: View {
    enum Field {
        case email,password
    }
    @State private var email = ""
    @State private var password = ""
    @State private var alertmessage = ""
    @State private var showingAlert = false
    @FocusState private var focusField : Field?
    @State private var buttonsDisabled = true
    @State private var path = NavigationPath()
    
    
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path){
                Image("ımg_x")
                    .resizable()
                //.frame(width: 300 ,height: 300,alignment: .top)
                //.foregroundColor(.white)
                    .scaledToFit()
                    .padding()
                Group{
                    TextField("Write Your Email",text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                        .focused($focusField,equals: .email)
                        .onSubmit {
                            focusField = .password
                        }
                        .onChange(of: email) { _ in
                            enableButtons()
                        }
                    
                    SecureField("Write Your Password",text: $password)
                        . textInputAutocapitalization(.never)
                        .submitLabel(.done)
                        .focused($focusField,equals: .password)
                        .onSubmit {
                            focusField = nil
                        }
                        .onChange(of: password) { _ in
                            enableButtons()
                        }
                }.textFieldStyle(.roundedBorder)
                    .overlay{
                        RoundedRectangle(cornerRadius: 5).stroke(.gray,lineWidth: 1)
                    }
                    .padding(.horizontal)
                HStack{
                    Button {
                        register()
                    } label: {
                        Text("Sign Up")
                    }
                    .padding(.trailing)
                    Button {
                        login()
                    } label: {
                        Text("Log In")
                    }
                    .padding(.leading)
                }
                .disabled(buttonsDisabled)
                .buttonStyle(.borderedProminent)
                .tint(Color("LogoColor"))
                .font(.title)
                .padding(.top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for:String.self){ view in
                    if view == "HomeView"{
                        HomeView()
                    }
                }
            }
            .alert(alertmessage,isPresented: $showingAlert){
                Button("OK",role: .cancel){}
            }
            
            .onAppear{
                if Auth.auth().currentUser != nil {
                    print("Login Succesful")
                    path.append("HomeView")
                }
            }
        }
        
        
        
        
        
    }
    
    func enableButtons(){
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordISGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordISGood)
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result , error in
            if let error = error {
                print(" sign İn Error: \(error.localizedDescription)")
                alertmessage = " Sign İn Error: \(error.localizedDescription)"
                showingAlert = true
            }
            else {
                print("Üye olma başarılı")
                path.append("HomeView")
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result , error in
            if let error = error {
                print(" Login Error: \(error.localizedDescription)")
                alertmessage = " Login Error: \(error.localizedDescription)"
                showingAlert = true
            }
            else {
                path.append("HomeView")
            }
        }
    }
}





struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white    )
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.purple.cornerRadius(180))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            LoginView()
        } else {
            // Fallback on earlier versions
        }
    }
}

