//
//  LoginViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService
import ReactorKit
import RxSwift

public final class LoginViewReactor: Reactor {
  public enum Action {
    case kakaoLogin(AuthProvider)
  }

  public enum Mutation {
    case isAuthorized(Bool)
    case setEndLaunching(Bool)
  }

  public struct State {

  }

  public let initialState: State
  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.initialState = State()
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .kakaoLogin(let provider):
      return authUseCase.login(provider: provider)
        .asObservable()
        .flatMap { [weak self] authToken -> Observable<Mutation> in
          guard let `self` = self else { return .empty() }
          return self.userUseCase.fetchMe().asObservable()
            .map { true }
            .catchErrorJustReturn(false)
            .map(Mutation.isAuthorized)
        }
    }
  }
}
