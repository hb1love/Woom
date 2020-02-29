//
//  Auth.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol Auth {
  func register(provider: AuthProvider) -> Single<AuthToken>
  func login(provider: AuthProvider) -> Single<AuthToken>
  func logout()

  func saveToken(authToken: AuthToken) throws
  func loadToken() -> AuthToken?
  func deleteToken()
}
