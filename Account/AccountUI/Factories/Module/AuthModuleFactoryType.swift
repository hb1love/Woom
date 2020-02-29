//
//  AuthModuleFactoryType.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol AuthModuleFactoryType {
  func makeLoginModule() -> LoginViewController
  func makeSignUpModule(authProvider: AuthProvider) -> SignUpViewController
}
