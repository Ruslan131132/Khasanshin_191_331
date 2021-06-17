//
//  JWT.swift
//  SwiftChat
//
//  Created by RUSLAN on 02.06.2021.
//

import SwiftUI

import Foundation


//extension String {
//
//    func fromBase64() -> String? {
//        guard let data = Data(base64Encoded: self) else {
//            return nil
//        }
//
//        return String(data: data, encoding: .utf8)
//    }
//
//    func toBase64() -> String {
//        return Data(self.utf8).base64EncodedString()
//    }
//
//}

extension SecTrust {

    var isSelfSigned: Bool? {
        guard SecTrustGetCertificateCount(self) == 1 else {
            return false
        }
        guard let cert = SecTrustGetCertificateAtIndex(self, 0) else {
            return nil
        }
        return cert.isSelfSigned
    }
}

extension SecCertificate {

    var isSelfSigned: Bool? {
        guard
            let subject = SecCertificateCopyNormalizedSubjectSequence(self),
            let issuer = SecCertificateCopyNormalizedIssuerSequence(self)
        else {
            return nil
        }
        return subject == issuer
    }
}

struct Token: Codable {
//    let id = UUID()
//    let username: String
//    let name: String
//    var userid: Int?
//    var id: Int?
//    var title: String
//    var body: String
    var token: String
}

struct ImageResponse: Codable{
    var image: String
    var message: String
    var timestamp: Double?
}




class apiCall {
    func getToken(completion:@escaping (Token) -> ()) {
        guard let url = URL(string: "http://51.15.91.29/ruslan/jwt/auth") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data, error == nil else{
                print("Что-то пошло не так")
                return
            }
            var users: Token?
            do{
                users = try! JSONDecoder().decode(Token.self, from: data)
                //                completion(.success(result))
                
            }
            catch{
                print("Ошибка парсинга!!! - \(error)")
                //                completion(.failure(.invalidData))
            }
            
            
            guard let json = users else{
                return
            }
            
            
            
            
            //            let users = try! JSONDecoder().decode(User.self, from: data!)
            print(json)
            
            DispatchQueue.main.async {
                completion(json)
            }
        }
        .resume()
    }
    
    
    
    func getImage(from url: String, completion:@escaping (ImageResponse) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in


            guard let data = data, error == nil else{
                print("Что-то пошло не так")
                return
            }
            var result: ImageResponse?
            do{
                result = try! JSONDecoder().decode(ImageResponse.self, from: data)
                //                completion(.success(result))

            }
            catch{
                print("Ошибка парсинга!!! - \(error)")
                //                completion(.failure(.invalidData))
            }


            guard let json = result else{
                return
            }




            //            let users = try! JSONDecoder().decode(User.self, from: data!)
//            print(json)

            DispatchQueue.main.async {
                completion(json)
            }
        }
        .resume()
    }
}


struct JWT: View {

    @State var email = ""
    
    @State var password = ""

    @State var hasToken = false
    
    @State var token = ""
    
    @State var imageUrl = ""
    
    @State var imageBase64 = ""
    

    func ConvertBase64StringToImage (imageBase64String: String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }

    
    
    var body: some View {
        
        
        
        
//        return NavigationView{
//
//            Form{
//
//                Button(action: {
//
////                    Api().getData(from: url){ (posts) in
////                        self.token = posts
////                    }
//
//
////                    { tok in
////                        self.token = tok.token
////                    }
//
//                    apiCall().getToken { (token) in
//                        self.token = token.token
//
//                    }
//
//                    hasToken = true
//
//
//
//
//                    print("\n\n\n--------- ТОКЕН ---------\n\(token)")
//
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
//
//
//
//
//                Text(token)
//
//
//
//
//                Button(action: {
//
////                    Api().getData(from: url){ (posts) in
////                        self.token = posts
////                    }
//
//
////                    { tok in
////                        self.token = tok.token
////                    }
//
//                    apiCall().getImage(from: "http://51.15.91.29/jwt/protected?token=\(token)") { (img) in
//                        self.imageBase64 = img.image
//
//                    }
//
//
//
//                    print("\n\n\nОТВЕТ:\n\(imageBase64)\n\n\n\n")
//
//
//                }) {
//                    Text("Получить картинку")
//                        .foregroundColor(.white)
//                        .fontWeight(.bold)
//                        .padding(.vertical)
//                        .padding(.horizontal, 50)
//
//
//
//
//
//                } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
//                    .cornerRadius(10)
//                .opacity(hasToken ? 1 : 0)
//
//
////                print()
//
//                if (imageBase64 != "") {
////                    guard let image = ConvertBase64StringToImage(imageBase64String: imageBase64) else{ fatalError("Unable to load") }
//                    Image(uiImage: ConvertBase64StringToImage (imageBase64String: imageBase64))
//                        .resizable()
//                        .frame(width: 300, height: 200)
//                }
//                else{
//                    Text("wucewycvwyv")
//                }
//
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
        
 

        return NavigationView{

            Form{
                VStack{
                    HStack(spacing: 15){
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                        Text("Вход")
                            .font(.system(size: 30, weight: .heavy, design: .default))

                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                    } .padding(.vertical, 30)


                    VStack{
                        VStack{ // FORM

                            VStack{

                                HStack{
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                                    TextField("email...", text: self.$email)
                                        .foregroundColor(.black)
                                }

                                Divider()
                                    .background(Color.white.opacity(0.5))






                            }.padding(.horizontal)
                            .padding(.top, 40)


                            VStack{

                                HStack{
                                    Image(systemName: "eye.slash.fill")
                                        .foregroundColor(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                                    SecureField("Пароль...", text: self.$password)
                                        .foregroundColor(.black)

                                }


                                Divider()
                                    .background(Color.white.opacity(0.5))






                            }.padding(.horizontal)
                            .padding(.top, 40)




                        } .padding()
                        .padding(.bottom, 65)
                        .background(Color(#colorLiteral(red: 0.9294117647, green: 0.9333333333, blue: 0.9411764706, alpha: 1)))

                        .cornerRadius(20)
                        .clipShape(Rectangle())
                        .contentShape(Rectangle())
                    }

                    .padding(.horizontal, 20)

                    Button(action: {

                        
                        apiCall().getToken { (token) in
                            self.token = token.token

                        }

                        hasToken = true

                        print("\n\n\n--------- ТОКЕН ---------\n\(token)")
                        
                        

                    }) {
                        Text("ВОЙТИ")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)



                    } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                        .cornerRadius(10)
                    .offset(y: -35)
//                    .opacity(self.hasToken ? 1 : 0)


                   


                }

                
                VStack{
                    HStack(){
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                        Text("ТОКЕН")
                            .font(.system(size: 28, weight: .heavy, design: .default))

                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                    } .padding(.bottom, 30)

                    HStack{
                       Text(token)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 5)
                            .background(Color(#colorLiteral(red: 0.9294117647, green: 0.9333333333, blue: 0.9411764706, alpha: 1)))

                    } .cornerRadius(10)

                } .opacity(hasToken ? 1 : 0)
                    .padding(.vertical, 30)

                VStack{
                    HStack(){
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                        
                        Button(action: {


                            apiCall().getImage(from: "http://51.15.91.29/ruslan/jwt/protected?token=\(token)") { (img) in
                            self.imageBase64 = img.image
                            }
                            
                            
                            print("\n\n\n---------ФОТО Base64---------\n\(imageBase64)\n\n\n\n")


                        }) {
                            Text("ФОТО")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
//                                .padding(.horizontal, 50)



                        } .background(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .cornerRadius(10)
    //                    .opacity(self.hasToken ? 1 : 0)
//                        Text("ФОТО")
//                            .font(.system(size: 30, weight: .heavy, design: .default))

                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)))
                            .frame(height: 1)

                    } .padding(.bottom, 30)

                    HStack{
                        
                        if (imageBase64 != "") {
                            Image(uiImage: ConvertBase64StringToImage (imageBase64String: imageBase64))
                                .resizable()
                                .frame(width: 300, height: 200)
                        }
                    } .cornerRadius(10)

                }.opacity(hasToken ? 1 : 0)
                    .padding(.vertical, 30)
               

            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("ЛР №8. JWT. SSL/TLS")
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




//extension URLSessionDelegate {
//    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//       //Trust the certificate even if not valid
//       let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
//
//       completionHandler(.useCredential, urlCredential)
//    }
//}




struct JWT_Previews: PreviewProvider {
    static var previews: some View {
        JWT()
    }
}
