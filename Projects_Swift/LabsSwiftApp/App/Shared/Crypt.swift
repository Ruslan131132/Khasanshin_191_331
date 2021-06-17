//
//  Crypt.swift
//  SwiftChat
//
//  Created by RUSLAN on 02.06.2021.
//

import SwiftUI
import CommonCrypto
import Foundation




extension String {

    func aesEncrypt(key:String, iv:String, options:Int = kCCOptionPKCS7Padding) -> String? {
        if let keyData = key.data(using: String.Encoding.utf8),
            let data = self.data(using: String.Encoding.utf8),
            let cryptData    = NSMutableData(length: Int((data.count)) + kCCBlockSizeAES128) {


            let keyLength              = size_t(kCCKeySizeAES256)
            let operation: CCOperation = UInt32(kCCEncrypt)
            let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmAES128)
            let options:   CCOptions   = UInt32(options)



            var numBytesEncrypted :size_t = 0

            let cryptStatus = CCCrypt(operation,
                                      algoritm,
                                      options,
                                      (keyData as NSData).bytes, keyLength,
                                      iv,
                                      (data as NSData).bytes, data.count,
                                      cryptData.mutableBytes, cryptData.length,
                                      &numBytesEncrypted)
            if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                cryptData.length = Int(numBytesEncrypted)
                let base64cryptString = cryptData.base64EncodedString(options: .lineLength64Characters)
                return base64cryptString


            }
            else {
                return nil
            }
        }
        return nil
    }

    func aesDecrypt(key:String, iv:String, options:Int = kCCOptionPKCS7Padding) -> String? {
        if let keyData = key.data(using: String.Encoding.utf8),
            let data = NSData(base64Encoded: self, options: .ignoreUnknownCharacters),
            let cryptData    = NSMutableData(length: Int((data.length)) + kCCBlockSizeAES128) {

            let keyLength              = size_t(kCCKeySizeAES256)
            let operation: CCOperation = UInt32(kCCDecrypt)
            let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmAES128)
            let options:   CCOptions   = UInt32(options)

            var numBytesEncrypted :size_t = 0

            let cryptStatus = CCCrypt(operation,
                                      algoritm,
                                      options,
                                      (keyData as NSData).bytes, keyLength,
                                      iv,
                                      data.bytes, data.length,
                                      cryptData.mutableBytes, cryptData.length,
                                      &numBytesEncrypted)

            if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                cryptData.length = Int(numBytesEncrypted)
                let unencryptedMessage = String(data: cryptData as Data, encoding:String.Encoding.utf8)
                return unencryptedMessage
            }
            else {
                return nil
            }
        }
        return nil
    }


}




struct Crypt: View {
    
    
    
    @State private var Message = ""

    @State private var key = ""

    @State private var iv = ""
    

    var encoded: String{
        if(iv == ""){
            return Message.aesEncrypt(key: key, iv: "abdefdsrfjdirogf") ?? "Ошибка!"
        } else{
            if (iv.count == 32){
                
                return Message.aesEncrypt(key: key, iv: iv) ?? "Ошибка!"
            } else{
                return "Поле iv должно иметь длину 32 символов!!!!"
            }

        }
    }
    var decoded: String{
        if(iv == ""){
            return encoded.aesDecrypt(key: key, iv: "abdefdsrfjdirogf") ?? "Ошибка!"
        } else{
            if (iv.count == 32){
            return encoded.aesDecrypt(key: key, iv: iv) ?? "Ошибка!"
            } else{
                return "Заполните поля правильнее!!!!"
            }

        }
    }
    
    
    var body: some View {
        return NavigationView{

            Form{
                Section(header: Text("Введите текст для шифрования:")) {
                    TextField("Текст...", text: $Message)
                }
                Section(header: Text("Введите ключ:")) {
                    TextField("Ключ...", text: $key)
                }
                Section(header: Text("Введите iv(16 байт):")) {
                     TextField("iv...", text: $iv)
                }
                if (Message == "" || key == "") {
//                    Section(header: Text("Зашифрованное сообщение:")) {
                        Text("Заполните все поля(Правильно)!").foregroundColor(.red)
//                    }
                
                } else {
                    Section(header: Text("Зашифрованное сообщение:")) {
                        
                        Text("\(encoded)")
                        

                    }
                    
                    Section(header: Text("Расшифрованное сообщение:")) {
                      
                          Text("\(decoded)")

                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Шифрование данных")
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

struct Crypt_Previews: PreviewProvider {
    static var previews: some View {
        Crypt()
    }
}
