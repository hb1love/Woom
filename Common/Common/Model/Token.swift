//
//  Token.swift
//  Common
//
//  Created by hb1love on 2020/02/29.
//  Copyright © 2020 depromeet. All rights reserved.
//

public typealias Token = String

public struct AuthToken: Codable {
  public let accessToken: Token
  public let refreshToken: Token

  public init(accessToken: Token, refreshToken: Token) {
    self.accessToken = accessToken
    self.refreshToken = refreshToken
  }
}
