//
//  AuthService.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol AuthUseCase {
  var currentToken: AuthToken? { get }

  func register(provider: AuthProvider) -> Single<AuthToken>
  func login(provider: AuthProvider) -> Single<AuthToken>
  func logout()
}

public final class AuthService: AuthUseCase {

  private(set) public var currentToken: AuthToken?

  private let auth: Auth

  public init(auth: Auth) {
    self.auth = auth
    self.currentToken = auth.loadToken()
    log.debug("currentToken exists: \(self.currentToken != nil)")
  }

  public func register(provider: AuthProvider) -> Single<AuthToken> {
    auth.register(provider: provider)
      .do(onSuccess: { [weak self] authToken in
        self?.currentToken = authToken
        try? self?.auth.saveToken(authToken: authToken)
      })
  }

  public func login(provider: AuthProvider) -> Single<AuthToken> {
    auth.login(provider: provider)
  }

  public func logout() {
    
  }
}
