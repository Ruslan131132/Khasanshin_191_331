//
//  SettingsScreen.swift
//  SwiftChat
//
//  CCreated by RUSLAN on 20.05.2021.
//

import SwiftUI



extension UINavigationController { //Расширение для Навигационной панели для красивого цвета
    override open func viewDidLoad() {
        super.viewDidLoad()


    let standard = UINavigationBarAppearance()
    standard.backgroundColor = #colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1) //When you scroll or you have title (small one)

    let compact = UINavigationBarAppearance()
    compact.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  //compact-height

    let scrollEdge = UINavigationBarAppearance()
    scrollEdge.backgroundColor = #colorLiteral(red: 0.2752762139, green: 0.5004453063, blue: 0.7620170116, alpha: 1)  //When you have large title

    navigationBar.standardAppearance = standard
    navigationBar.compactAppearance = compact
    navigationBar.scrollEdgeAppearance = scrollEdge



 }

}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


struct SettingsScreen: View {
	@EnvironmentObject private var userInfo: UserInfo
	
	private var isUsernameValid: Bool {
		!userInfo.username.trimmingCharacters(in: .whitespaces).isEmpty
	}
	
	var body: some View {
		Form {
			Section(header: Text("Имя пользователя")) {
				TextField("Например, Руслан", text: $userInfo.username)

				NavigationLink("Продолжить", destination: ChatScreen())
					.disabled(!isUsernameValid)
			}
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
//                    Image("left-vk")
                    Text("ЧАТ")
                        .font(.system(size: 15, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitle(Text("Чат"), displayMode: .inline)
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
