//
//  ApplicationConfiguration.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import ShareUI
import ShareService

struct ApplicationConfiguration:
  ShareUIConfiguration,
  ShareServiceConfiguration {

  static let shareCoordinatorFactory = ShareUIInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let shareUseCase = ShareServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )


  // MARK: - ShareUIConfiguration

  static let shareUIDependency: ShareUIDependency = {
    return ShareUIDependency(shareUseCase: shareUseCase)
  }()


  // MARK: - ShareServiceConfiguration

  static let baseUrl: String = {
    return "http://test.team4.ryulth.com/"
  }()

  static let shareServiceDependency: ShareServiceDependency = {
    return ShareServiceDependency()
  }()

}
