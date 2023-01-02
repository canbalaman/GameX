import SwiftUI
import Firebase



struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var DarkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    
    
    var optionPicker = ["Türkçe","English"]
    var body: some View {
        NavigationView{
            Form{
                Section(header : Text("Display"),
                        footer:Text("Dark mode settings"))
                {
                    Toggle(isOn: $DarkModeEnabled,
                           label: {
                        Text("Dark Mode")
                        
                    })
                    .onChange(of: DarkModeEnabled,perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: DarkModeEnabled, system: systemThemeEnabled)
                    })
                    
                    Toggle(isOn: $systemThemeEnabled,
                           label: {
                        Text("System Theme")
                        
                    })
                    .onChange(of: systemThemeEnabled,perform:{ _ in
                        SystemThemeManager.shared.handleTheme(darkMode: DarkModeEnabled, system: systemThemeEnabled)
                    })
                }
                
                Section(header : Text("Account"),
                        footer:Text("Account settings"))
                {
                    Button {
                        do{
                            try Auth.auth().signOut()
                            print("log out ok")
                            dismiss()
                        }
                            catch{
                                print("sign out error")
                        }
                            
                     
                        
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
        SettingView(DarkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
    }
}
