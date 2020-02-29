//
//  AuthRepository.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public class AuthRepository: Auth {

  private let local: AuthLocalDataSource
  private let remote: AuthRemoteDataSource

  public init(
    local: AuthLocalDataSource,
    remote: AuthRemoteDataSource) {
    self.local = local
    self.remote = remote
  }

  public func register(provider: AuthProvider) -> Single<AuthToken> {
    remote.register(provider: provider)
  }

  public func login(provider: AuthProvider) -> Single<AuthToken> {
    remote.login(provider: provider)
  }

  public func logout() {

  }

  public func saveToken(authToken: AuthToken) throws {
    try local.saveToken(authToken: authToken)
    log.debug("AuthToken saved at local")
  }

  public func loadToken() -> AuthToken? {
    local.loadToken()
  }

  public func deleteToken() {
    local.deleteToken()
  }
}
