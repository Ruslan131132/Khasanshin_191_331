//
//  ContentView.swift
//  Shared
//
//  Created by RUSLAN on 20.05.2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    
	@StateObject private var userInfo = UserInfo()//NavLink on page "Беседа"
	
    @State private var selectedView = 6
    
//    @State private var isStart = true
    
    var body: some View {
        
        TabView(selection: $selectedView){
            Crypt()
                .tabItem {
                    Image(systemName: "6.circle")
                    Text("LAB6")
                } . tag(6)
            NavigationView {
                SettingsScreen()
            }
            .environmentObject(userInfo)
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor( .white)
            .tabItem {
                Image(systemName: "7.circle")
                Text("LAB7")
            } . tag(7)
            JWT()
                .tabItem {
                    Image(systemName: "8.circle")
                    Text("LAB8")
                } . tag(8)
            Firebase()
                .tabItem {
                    Image(systemName: "9.circle")
                    Text("TEST")
                } . tag(9)
        }
        .onChange(of: selectedView, perform: { index in
          print(selectedView)
            Database.database().reference().child("ActiveView").child("TabView").setValue(selectedView)
            
          withAnimation {
//            selectedView = dates[1]
          }
        })//отслеживание выбранного View в Tabview
        
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
