//
//  NavigationViewControllerMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//

import Foundation
import UIKit
@testable import MarvelHeroesApp

class NavigationViewControllerMock: UINavigationController {
    var pushedViewControllerName = ""
    var presentedViewControllerName = ""
    var didPopViewController = false

    var shouldAutorotateCalled = false
    var supportedInterfaceOrientationsCalled = false
    var preferredInterfaceOrientationForPresentationCalled = false

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        self.presentedViewControllerName = String(describing: type(of: viewControllerToPresent.self))
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.pushedViewControllerName = String(describing: type(of: viewController.self))
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        super.popViewController(animated: animated)
        self.didPopViewController = true
        return nil
    }

    override var shouldAutorotate: Bool {
        self.shouldAutorotateCalled = true
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        self.supportedInterfaceOrientationsCalled = true
        guard let interfaceOrientationMask = visibleViewController?.supportedInterfaceOrientations else {
            return .portrait
        }
        return interfaceOrientationMask
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        self.preferredInterfaceOrientationForPresentationCalled = true
        return (visibleViewController?.preferredInterfaceOrientationForPresentation)!
    }
}

class BaseViewControllerMock: BaseView {
    var presentedViewControllerName = ""
    var didDismissViewController = false
    var didPresentViewController = false

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        runOnMainThread { [weak self] in
            self?.present(viewControllerToPresent, animated: false)
        }

        didPresentViewController = true
        presentedViewControllerName = String(describing: type(of: viewControllerToPresent.self))
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        didDismissViewController = true
    }
}

extension BaseViewControllerMock: BaseViewProtocol {}
