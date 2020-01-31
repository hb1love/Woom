//
//  ProfileThumbnailView.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit

final class ProfileThumbnailView: BaseView {

  // MARK: - Subviews

  var profileImage: UIImageView!

  // MARK: - Properties

  var imageUrl: String? {
    didSet {
      
    }
  }

  override func setupSubviews() {
    profileImage = UIImageView().also {
      addSubview($0)
    }
  }

  override func setupConstraints() {
    profileImage.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
