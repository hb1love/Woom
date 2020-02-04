//
//  LoginCoordinator.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol LoginCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

public final class LoginCoordinator: BaseCoordinator, LoginCoordinatorOutput {

  private let coordinatorFactory: AccountCoordinatorFactoryProtocol
  private let moduleFactory: LoginModuleFactoryType
  private let router: Routable

  public var finishFlow: (() -> Void)?

  init(
    coordinatorFactory: AccountCoordinatorFactoryProtocol,
    moduleFactory: LoginModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
  }

  public override func start() {
    showLogin()
  }

  private func showLogin() {
    let loginModule = moduleFactory.makeLoginModule()
//    myPageModule.didLogout = {
//
//    }
    router.setRoot(loginModule)
  }

  private func runLoginFlow() {

  }
}
