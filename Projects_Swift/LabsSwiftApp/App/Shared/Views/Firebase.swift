//
//  Firebase.swift
//  SwiftChat
//
//  Created by RUSLAN on 09.06.2021.
//

import SwiftUI
import Firebase

struct Firebase: View {
    
    @State private var b1 = 0
    @State private var b2 = 0
    @State private var b3 = 0
    
    
    
    
    var body: some View {
        
        return NavigationView{
                VStack{
                    HStack{
                        Button(action: {
                            b1 += 1
                            print("Сработала кнопка 1")
                            Database.database().reference().child("Button1").child("Pressed").setValue(b1)
                            
                            Database.database().reference().child("Button1").child("Press_Date").setValue("\(Date().addingTimeInterval(10800))")
                            
                        }) {
                            Text("Кнопка 1")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                            
                            
                            
                        } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                        .cornerRadius(10)
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            b2 += 1
                            print("Сработала кнопка 2")
                            Database.database().reference().child("Button2").child("Pressed").setValue(b2)
                            
                            Database.database().reference().child("Button2").child("Press_Date").setValue("\(Date().addingTimeInterval(10800))")
                            
                        }) {
                            Text("Кнопка 2")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                            
                            
                            
                        } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                    HStack{
                        Button(action: {
                            
                            b3 += 1
                            print("Сработала кнопка 3")
                            Database.database().reference().child("Button3").child("Pressed").setValue(b3)
                            Database.database().reference().child("Button3").child("Press_Date").setValue("\(Date().addingTimeInterval(10800))")
                           
                            
                        }) {
                            Text("Кнопка 3")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                            
                            
                            
                        } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                        .cornerRadius(10)
                    }
                }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("ЛР №9. Firebase")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .heavy, design: .default))
                    }
                }
            }
            //            .navigationBarTitle("Шифрование данных", displayMode: .inline)
            .navigationBarItems(leading: HStack{Image("left-vk")
                .resizable()
                .frame(width: 50, height: 50)
            }, trailing: HStack {Image("right-icon")
                .resizable()
                .frame(width: 30, height: 30)
            }
            )
        }
        
    }
}

struct Firebase_Previews: PreviewProvider {
    static var previews: some View {
        Firebase()
    }
}
