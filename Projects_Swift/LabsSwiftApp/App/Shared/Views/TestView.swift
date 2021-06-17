//
//  TestView.swift
//  SwiftChat
//
//  Created by RUSLAN on 07.06.2021.
//


import SwiftUI
















struct TestView: View {
    
    
    @State private var token = ""
    
    let url = "https://51.15.91.29/jwt/auth"
    
    var body: some View {
        
        
        
        
        
//        return NavigationView{
//
//            Form{
//
//                Button(action: {
//
//                    token = getApi().getData(from: url)
//
//
////                    { tok in
////                        self.token = tok.token
////                    }
//                }) {
//                    Text("ВОЙТИ")
//                        .foregroundColor(.white)
//                        .fontWeight(.bold)
//                        .padding(.vertical)
//                        .padding(.horizontal, 50)
//
//
//
//
//                } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
//                    .cornerRadius(10)
//
//
//                Text(token)
//
//                Text(getApi().getData(from: url))
//
//
//            }
//            .navigationBarTitle("Получение токена", displayMode: .inline)
//            .navigationBarItems(leading: HStack{Image("left-vk")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                }, trailing: HStack {Image("right-icon")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//            }
//                        )
//
//
//
//
//        }
//
        
        Text("Test")
        
        
    }
}




















struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
