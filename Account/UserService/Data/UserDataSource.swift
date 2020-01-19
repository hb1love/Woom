//
//  UserDataSource.swift
//  UserService
//
//  Created by NHNEnt on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol UserDataSource {
  func me() -> Single<User>
}
