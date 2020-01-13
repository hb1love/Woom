//
//  ShareListCoordinator.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol ShareListCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

public final class ShareListCoordinator: BaseCoordinator, ShareListCoordinatorOutput {

  public var finishFlow: (() -> Void)?
  private let coordinatorFactory: ShareCoordinatorFactoryProtocol
  private let moduleFactory: ShareListModuleFactoryType
  private let router: Routable

  init(
    coordinatorFactory: ShareCoordinatorFactoryProtocol,
    moduleFactory: ShareListModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
  }

  public override func start() {
//    showWelcome()
  }

//  private func showWelcome() {
//    let welcomeModule = moduleFactory.makeWelcomeModule()
//    welcomeModule.onSelectSideMenu = { [weak self] in
//      self?.runSettingsFlow()
//    }
//    welcomeModule.onCreateProfile = { [weak self] in
//      self?.runEditFlow()
//    }
//    router.setRoot(welcomeModule)
//  }
//
//  private func runEditFlow() {
//    let (coordinator, module) = coordinatorFactory.makeEditCoordinatorBox()
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      self?.router.dismiss()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    router.present(module)
//    coordinator.start()
//  }
//
//  private func runSettingsFlow() {
//    let (coordinator, module) = coordinatorFactory.makeSettingsCoordinatorBox()
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      self?.router.dismiss()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    router.present(module)
//    coordinator.start()
//  }
}
