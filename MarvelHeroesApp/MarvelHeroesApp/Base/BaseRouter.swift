//
//  BaseRouter.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import UIKit

class BaseRouter {
  // Declared weak for the ARC to destroy them.
  internal weak var baseView: UIViewController?
  
  required init() {
    // Not implemented
  }
  
  static func setRoot(navigationController: UIViewController) {
    guard let window = UIApplication.shared.delegate?.window else { return }
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
  
  static func logout(viewController: UIViewController? = nil) {
    if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {
      
      navigationController.popToRootViewController(animated: true)
      
    } else {
      if let viewController = viewController {
        viewController.dismiss(animated: true, completion: nil)
      }
      if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {
        navigationController.popToRootViewController(animated: true)
      }
    }
  }
  
  // MARK: PRIVATE BASE
  internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
    self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
  }
  
  internal func popViewController(animated: Bool) {
    self.baseView?.navigationController?.popViewController(animated: animated)
  }
}
