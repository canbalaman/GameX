import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView{
            
            Form{
                Text("Welcome") // kullanıcı adı gelecek
                Section(header : Text("Display")){
                    Toggle(isOn: .constant(false),label:{
                      Text("Dark Mode")
                    })
                }
            }.navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
