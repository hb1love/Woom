//
//  AuthLocalDataSource.swift
//  AuthService
//
//  Created by hb1love on 2020/03/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import KeychainAccess
import RxSwift

final class AuthLocalRepository: AuthLocalDataSource {

  private let keychain = Keychain(service: "com.depromeet.woom")

  func saveToken(authToken: AuthToken) throws {
    try keychain.set(authToken.accessToken, key: "accessToken")
    try keychain.set(authToken.refreshToken, key: "refreshToken")
  }

  func loadToken() -> AuthToken? {
    guard let accessToken = keychain["accessToken"] else { return nil }
    guard let refreshToken = keychain["refreshToken"] else { return nil }
    return AuthToken(accessToken: accessToken, refreshToken: refreshToken)
  }

  func deleteToken() {
    try? keychain.remove("accessToken")
    try? keychain.remove("refreshToken")
  }
}
