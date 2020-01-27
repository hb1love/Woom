//
//  PostView.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ShareService
import SnapKit
import ReactorKit

final class PostView: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let topBottonPadding = 10.f
    static let leadingPadding = 29.f
    static let profileSize = 60.f
  }

  var profileThumbnailView: ProfileThumbnailView!

  // MARK: - Properties

  var post: Post?

  override func setupSubviews() {
    profileThumbnailView = ProfileThumbnailView().also {
      addSubview($0)
    }
  }

  override func setupConstraints() {
    profileThumbnailView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Metric.topBottonPadding)
      $0.leading.equalToSuperview().offset(Metric.leadingPadding)
      $0.bottom.equalToSuperview().offset(-Metric.topBottonPadding)
      $0.width.height.equalTo(Metric.profileSize)
    }
  }
}
