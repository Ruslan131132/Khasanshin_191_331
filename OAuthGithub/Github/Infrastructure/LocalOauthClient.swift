//
//  LocalOauthClient.swift
//  Github
//
//  Created by RUSLAN on 01/06/2021.
//

import Foundation


class LocalOauthClient: OAuthClient {
    func exchangeCodeForToken(code: String, state: String, completion: @escaping (Result<TokenBag, Error>) -> Void) {
        completion(.success(TokenBag(accessToken: "anAccessToken")))
    }
    
    func getAuthPageUrl(state: String) -> URL? {
        let urlString = "https://codesandbox.io/s/affectionate-wind-wp72f"
        
        return URL(string: urlString)!
    }
}
