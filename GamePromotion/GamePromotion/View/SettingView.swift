import SwiftUI

struct SettingView: View {
    @State private var pickerNumber = 0
    
    @State var DarkModeİsActive: Bool = false
    var optionPicker = ["Türkçe","English"]
    var body: some View {
        NavigationView{
            Form{
                Section(header : Text("Display"),
                        footer:Text("Dark mode settings"))
                {
                    Toggle(isOn: $DarkModeİsActive){
                        Text("Dark Mode")
                    }
                }
                
                Section(header : Text("Language"),
                        footer:Text("Language settings"))
                {
                    
                    
                    Picker(selection:$pickerNumber,label:
                            Text("Select Language")){
                        ForEach(0..<optionPicker.count){
                            
                            Text(self.optionPicker[$0])
                        }
                    }
                    
                }
                Section(header : Text("Account"),
                        footer:Text("Account settings"))
                {
                    Button {
                        
                    } label: {
                        Text("Sign Out")
                    }

                }
                
                    
                }
               

            }.navigationTitle("Settings")
            

        }
        
        
        
    }


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
