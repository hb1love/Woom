//
//  ShareListViewSection.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxDataSources

enum ShareListViewSection {
  case hotTalent([ShareListViewSectionItem])
  case recommendCategory([ShareListViewSectionItem])
  case hotPost([ShareListViewSectionItem])
}

extension ShareListViewSection: SectionModelType {
  var items: [ShareListViewSectionItem] {
    switch self {
    case .hotTalent(let items): return items
    case .recommendCategory(let items): return items
    case .hotPost(let items): return items
    }
  }

  init(original: ShareListViewSection, items: [ShareListViewSectionItem]) {
    switch original {
    case .hotTalent: self = .hotTalent(items)
    case .recommendCategory: self = .recommendCategory(items)
    case .hotPost: self = .hotPost(items)
    }
  }
}

enum ShareListViewSectionItem {
//  case hotTalent(ShotCellReactor)
  case hotTalent
  case recommendCategory
  case post(PostCellReactor)
}
