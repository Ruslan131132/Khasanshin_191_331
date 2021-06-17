//
//  ContentView.swift
//  CryptTest
//
//  Created by RUSLAN on 08.06.2021.
//




//class YourViewController : UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let notificationCenter = NotificationCenter.default
//        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
//    }
//
//    @objc func appMovedToBackground() {
//        print("App moved to background!")
//    }
//}

//class ViewController: NSViewController, NSWindowDelegate {
//    // ... rest of the code goes here
//    override func viewDidAppear() {
//        self.view.window?.delegate = self
//    }
//    func windowShouldClose(_ sender: Any) {
//        NSApplication.shared().terminate(self)
//    }
//}

import SwiftUI
import CryptoSwift

struct ContentView: View {
//    let text: Array<UInt8> = Array("Test".utf8)
//    let key: Array<UInt8> = Array("1234567891011121314151617181920".utf8)
//    let iv: Array<UInt8> = Array("123456789101".utf8)
//    let header: Array<UInt8> = Array("123456789".utf8)
    
    
    @State private var text = ""
    
    @State private var key = ""
    
//    @State private var encrypted = ""
//
//    @State private var decrypted = ""
    
    var encrypted: String{
        if (key != "" && text != "") {
            return Endcode_AES_ECB(strToEncode: text, key: key)
        } else{
            return ""
        }
    }
    
    var decrypted: String{
        if (encrypted != "") {
            return Decode_AES_ECB(strToDecode: encrypted , key: key)
        } else{
            return ""
        }
    }
    
    func Endcode_AES_ECB(strToEncode:String,key:String)->String {
            
            var encodeString = ""
            do{
                
                let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize),blockMode: ECB())
                let encoded = try aes.encrypt(strToEncode.bytes)
                encodeString = encoded.toBase64()!
                print(encodeString)
            }catch{
                print(error.localizedDescription)
            }
            return encodeString
    }
        
        //decode
    func Decode_AES_ECB(strToDecode:String,key:String)->String {
            
            var decodeStr = ""
            let data = NSData(base64Encoded: strToDecode, options: NSData.Base64DecodingOptions.init(rawValue: 0))
            var encrypted: [UInt8] = []
            let count = data?.length
            for i in 0..<count! {
                var temp:UInt8 = 0
                data?.getBytes(&temp, range: NSRange(location: i,length:1 ))
                encrypted.append(temp)
            }
            do {
                let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize),blockMode: ECB())
                let decode = try aes.decrypt(encrypted)
                let encoded = Data(decode)
                decodeStr = String(bytes: encoded.bytes, encoding: .utf8)!
            }catch{
                print(error.localizedDescription)
            }
            
            
            return decodeStr
        }

    
    
    var body: some View {
        
        
        Form{
            TextField("Введите сообщение", text: self.$text)
            TextField("Введите ключ", text: self.$key)
            Text("Зашифровано:")
                .foregroundColor(encrypted == "" ? .red : .green)
            Text(encrypted)
            Text("Расшифровано:")
                .foregroundColor(encrypted == "" ? .red : .green)
            Text(decrypted)
        }
       
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
