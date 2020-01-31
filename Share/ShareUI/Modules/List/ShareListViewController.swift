//
//  ShareListViewController.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import RxCocoa
import RxSwift
import RxDataSources
import ReactorKit

public final class ShareListViewController: BaseViewController, StoryboardView {

  @IBOutlet weak var feedCollectionView: UICollectionView!

  // MARK: - Properties

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<ShareListViewSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .hotTalent:
        let cell = collectionView.dequeue(HotTalentsCell.self, for: indexPath)!
        return cell
      case .recommendCategory:
        let cell = collectionView.dequeue(RecommendCategoryCell.self, for: indexPath)!
        return cell
      case .post(let reactor):
        let cell = collectionView.dequeue(PostCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    },
    configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
      switch dataSource[indexPath.section] {
      case .hotTalents:
        let headerView = collectionView.dequeue(HotTalentsHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "급상승 재능러"
        return headerView
      case .recommendCategories:
        let headerView = collectionView.dequeue(HotTalentsHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "추천 카테고리"
        return headerView
      case .hotPosts:
        let headerView = collectionView.dequeue(HotTalentsHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "인기 게시물"
        return headerView
      }
    }
  )

  public override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    feedCollectionView.collectionViewLayout.invalidateLayout()
  }

  public override func setupSubviews() {
    super.setupSubviews()
    feedCollectionView.register(cell: HotTalentsHeaderView.self)
    feedCollectionView.register(cell: HotTalentsCell.self)
    feedCollectionView.register(cell: RecommendCategoryCell.self)
    feedCollectionView.register(cell: PostCell.self)
  }

  public func bind(reactor: ShareListViewReactor) {
    rx.viewWillAppear
      .subscribe(onNext: { [weak self] in
        self?.navigationController?.setNavigationBarHidden(true, animated: false)
      })
      .disposed(by: disposeBag)

    rx.viewWillAppear
      .map { .refresh }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    feedCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: feedCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension ShareListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .hotTalents:
      return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    case .recommendCategories:
      return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    case .hotPosts:
      return .zero
    }
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    4
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    10
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 44)
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: PostCell.defaultHeight)
  }
}
