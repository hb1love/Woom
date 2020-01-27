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

  @IBOutlet weak var feedTableView: UITableView!

  // MARK: - Properties

  private lazy var dataSource = RxTableViewSectionedReloadDataSource<ShareListViewSection>(
    configureCell: { (dataSource, tableView, indexPath, sectionItem) -> UITableViewCell in
      switch sectionItem {
      case .hotTalent:
        let cell = tableView.dequeue(HotTalentsCell.self)!
        return cell
      case .recommendCategory:
        let cell = tableView.dequeue(RecommendCategoryCell.self)!
        return cell
      case .post(let reactor):
        let cell = tableView.dequeue(PostCell.self)!
        cell.reactor = reactor
        return cell
      }
    }
  )

//  private static func dataSourceFactory(
//    shotTileCellDependency: ShotTileCell.Dependency
//  ) -> RxTableViewSectionedReloadDataSource<ShareListViewSection> {
//    return .init(
//      configureCell: { dataSource, collectionView, indexPath, sectionItem in
//        switch sectionItem {
//        case .shotTile(let reactor):
//          let cell = collectionView.dequeue(Reusable.shotTileCell, for: indexPath)
//          cell.dependency = shotTileCellDependency
//          cell.reactor = reactor
//          return cell
//        }
//      },
//      configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
//        if kind == UICollectionView.elementKindSectionFooter {
//          return collectionView.dequeue(Reusable.activityIndicatorView, kind: kind, for: indexPath)
//        }
//        return collectionView.dequeue(Reusable.emptyView, kind: "empty", for: indexPath)
//      }
//    )
//  }

  public override func setupSubviews() {
    super.setupSubviews()
    feedTableView.register(cell: HotTalentsCell.self)
    feedTableView.register(cell: RecommendCategoryCell.self)
    feedTableView.register(cell: PostCell.self)
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

    reactor.state.map { $0.sections }
      .bind(to: feedTableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}
