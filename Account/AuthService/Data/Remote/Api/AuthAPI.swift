//
//  AuthAPI.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation
import Common
import Moya

typealias AuthNetworking = Networking<AuthAPI>

enum AuthAPI {
  case register(provider: AuthProvider)
  case login(provider: AuthProvider)
  case logout
  case refresh(token: AuthToken)
  case verify(token: AuthToken)
}

extension AuthAPI: TargetType {
  var baseURL: URL {
    return URL(string: authServiceConfig.baseUrl)!
  }

  var path: String {
    switch self {
    case .register(let provider): return "auth/register/\(provider.rawValue)"
    case .login(let provider): return "auth/login/\(provider.rawValue)"
    case .logout: return "auth/logout"
    case .refresh(let token): return "auth/refresh/\(token.accessToken)"
    case .verify(let token): return "auth/verify/\(token.accessToken)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .refresh,
         .verify:
      return .get
    default:
      return .post
    }
  }

  var task: Task {
    switch self {
    case .register(let provider):
      return .requestParameters(
        parameters: makeRegisterParam(provider: provider),
        encoding: JSONEncoding.default
      )
    case .login(let provider):
      return .requestParameters(
        parameters: makeLoginParam(provider: provider),
        encoding: JSONEncoding.default
      )
    default:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
  
  var sampleData: Data {
    switch self {
    default:
      return Data()
    }
  }
}

extension AuthAPI {
  func makeRegisterParam(provider: AuthProvider) -> [String: Any] {
    var parameters = [String: Any]()
    switch provider {
    case .apple(let authParam):
      parameters["appleId"] = authParam.id
      parameters["accessToken"] = authParam.accessToken
    case .kakao(let authParam):
      parameters["kakaoId"] = authParam.id
      parameters["accessToken"] = authParam.accessToken
    }
    return parameters
  }

  func makeLoginParam(provider: AuthProvider) -> [String: Any] {
    var parameters = [String: Any]()
    switch provider {
    case .apple(let authParam):
      parameters["appleId"] = authParam.id
      parameters["accessToken"] = authParam.accessToken
      if let email = authParam.email {
        parameters["appleEmail"] = email
      }
    case .kakao(let authParam):
      parameters["kakaoId"] = authParam.id
      parameters["accessToken"] = authParam.accessToken
      if let email = authParam.email {
        parameters["kakaoEmail"] = email
      }
    }
    return parameters
  }
}
