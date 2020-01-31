//
//  Member.swift
//  Common
//
//  Created by hb1love on 2020/01/31.
//  Copyright © 2020 depromeet. All rights reserved.
//

public struct Member: Codable {
  public var id: String?
  public var photoUrl: String?
  public var nickname: String?
  public var introduce: String?
  public var has: [Skill]?
  public var wanna: [Skill]?

  public static let mock = Member(
    id: "1",
    photoUrl: "https://is.gd/yptK4j",
    nickname: "여신님",
    introduce: "안녕하세요. 재능 교환 언제든 환영합니다 :)",
    has: [.photoshop],
    wanna: [.app]
  )
}
