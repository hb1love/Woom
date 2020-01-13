//
//  MainTabBarController.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
//  var services = [ServiceType: Coordinator]()
//
//  init(services: [ServiceType: Coordinator]) {
//    super.init(nibName: nil, bundle: nil)
//    self.services = services
//    setupSubviews()
//  }
//
//  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    setupSubviews()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  func setupSubviews() {
//    var serviceViews = [UIViewController]()
//    ServiceType.allCases.forEach { service in
//      if let coordinator = self.services[service] {
//        let tabBarItem = UITabBarItem()
//        tabBarItem.title = service.rawValue
//        switch service {
//        case .project:
//          tabBarItem.image = UIImage(named: "ic_bottom_nav_project_inactive")
//          tabBarItem.selectedImage = UIImage(named: "ic_bottom_nav_project_active")!
//            .withRenderingMode(.alwaysOriginal)
//        default:
//          break
//        }
//        let navigationController = coordinator.navigationController
//        navigationController.tabBarItem = tabBarItem
//        serviceViews.append(navigationController)
//        coordinator.start()
//      }
//    }
//    setViewControllers(serviceViews, animated: true)
//  }
}
