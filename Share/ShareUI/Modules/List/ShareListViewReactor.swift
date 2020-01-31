//
//  ShareListViewReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService
import RxSwift
import ReactorKit

public final class ShareListViewReactor: Reactor {
  public enum Action {
    case refresh
    case loadMore
  }

  public enum Mutation {
    case setRefreshing(Bool)
    case setFeeds([Post])
    case appendFeeds([Post])
  }

  public struct State {
    var isRefreshing: Bool = false
    var sections: [ShareListViewSection] = [.hotTalents([])]
  }

  public let initialState: State
  private let shareUseCase: ShareUseCase

  public init(shareUseCase: ShareUseCase) {
    self.initialState = State()
    self.shareUseCase = shareUseCase
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refresh:
      guard !self.currentState.isRefreshing else { return .empty() }
      let startRefreshing = Observable<Mutation>.just(.setRefreshing(true))
      let endRefreshing = Observable<Mutation>.just(.setRefreshing(false))
      let setPosts = shareUseCase.feeds()
        .asObservable()
        .map(Mutation.setFeeds)

      return .concat([startRefreshing, setPosts, endRefreshing])

    case .loadMore:
      guard !self.currentState.isRefreshing else { return .empty() }
      let appendPosts = shareUseCase.feeds()
      .asObservable()
      .map(Mutation.appendFeeds)

      return .concat([appendPosts])
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
      case .setRefreshing(let isRefreshing):
        let isEmpty = state.sections.first?.items.isEmpty == true
        state.isRefreshing = isRefreshing && !isEmpty
        return state

//      case let .setLoading(isLoading):
//        state.isLoading = isLoading
//        return state

      case .setFeeds(let posts):
        let sectionItems = self.postSectionItems(with: posts)
        state.sections = [.hotTalents([]), .recommendCategories([]), .hotPosts(sectionItems)]
        return state

      case .appendFeeds(let posts):
        let sectionItems = state.sections[0].items + self.postSectionItems(with: posts)
        state.sections = [.hotPosts(sectionItems)]
        return state
    }
  }

  private func postSectionItems(with posts: [Post]) -> [ShareListViewSectionItem] {
    posts
      .map(PostCellReactor.init)
      .map(ShareListViewSectionItem.post)
  }
}
