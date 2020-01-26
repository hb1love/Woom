//
//  ShareModuleFactory.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService

public final class ShareModuleFactory
  : ShareEditModuleFactoryType
  , ShareListModuleFactoryType {

  private let shareUseCase: ShareUseCase

  public init(shareUseCase: ShareUseCase) {
    self.shareUseCase = shareUseCase
  }

  public func makeShareEditModule() -> ShareEditViewController {
    let shareEditViewReactor = ShareEditViewReactor(
      shareUseCase: shareUseCase
    )
    let shareEditViewController = ShareEditViewController.controllerFromStoryboard("ShareEdit", bundleId: "com.depromeet.um.shareui")
    shareEditViewController.reactor = shareEditViewReactor
    return shareEditViewController
  }

  public func makeShareListModule() -> ShareListViewController {
    return ShareListViewController()
  }
}
