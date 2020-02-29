//
//  AuthDataSource.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol AuthRemoteDataSource {
  func register(provider: AuthProvider) -> Single<AuthToken>
  func login(provider: AuthProvider) -> Single<AuthToken>
  func logout()
}

public protocol AuthLocalDataSource {
  func saveToken(authToken: AuthToken) throws
  func loadToken() -> AuthToken?
  func deleteToken()
}
