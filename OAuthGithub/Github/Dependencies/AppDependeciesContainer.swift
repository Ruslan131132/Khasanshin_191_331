//
//  AppDependeciesContainer.swift
//  Github
//
//  Created by RUSLAN on 01/06/2021.
//

import UIKit

class AppDependencyContainer {
    let deepLinkHandler = DeepLinkHandler()
    
    func makeMainViewController() -> UIViewController {
        let redirectUri = URL(string: "it.iacopo.github://authentication")!
        let oAuthConfig = OAuthConfig(authorizationUrl: URL(string: "https://github.com/login/oauth/authorize")!,
                                      tokenUrl: URL(string: "https://github.com/login/oauth/access_token")!,
                                      clientId: "b8db195e2da82279a0b9",
                                      clientSecret: "743c99d70662f9eedf3232e42eedcbceb735116b",
                                      redirectUri: redirectUri,
                                      scopes: ["repo", "user"])
        let oAuthClient = RemoteOAuthClient(config: oAuthConfig, httpClient: HTTPClient())
        let oAuthService = OAuthService(oauthClient: oAuthClient)
        let deepLinkCallback: (DeepLink) -> Void = { deepLink in//добавляем ссылку ответ - получаем deeplink меняем на токен
            if case .oAuth(let url) = deepLink {
                oAuthService.exchangeCodeForToken(url: url)
            }
        }
        deepLinkHandler.addCallback(deepLinkCallback, forDeepLink: DeepLink(url: redirectUri)!)
        let loginVC = LoginViewController(oAuthService: oAuthService)
        let navigationController = UINavigationController(rootViewController: loginVC)
        return navigationController
    }
}
