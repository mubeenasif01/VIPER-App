//
//  PostRouter.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

//final class PostRouter: PostRouterProtocol {
//    weak var viewController: UIViewController?
//
//    func navigateToPostCreation() {
//        let postCreationVC = PostCreationViewController()
//        postCreationVC.presenter = PostCreationPresenter()
//        viewController?.navigationController?.pushViewController(postCreationVC, animated: true)
//    }
//}

//final class PostRouter: PostRouterProtocol {
//    weak var viewController: UIViewController?
//
//    func navigateToPostCreation() {
//        // Ensure the shared PostInteractor is passed to PostCreation
//        guard let postInteractor = (viewController as? PostViewController)?.presenter.interactor else {
//            fatalError("PostInteractor not found in PostPresenter.")
//        }
//
//        // Build the PostCreation module using the Module Builder
//        let postCreationVC = PostCreationModuleBuilder.build(postInteractor: postInteractor)
//
//        // Navigate to the PostCreationViewController
//        viewController?.navigationController?.pushViewController(postCreationVC, animated: true)
//    }
//}

//final class PostRouter: PostRouterProtocol {
//    weak var viewController: UIViewController?
//
//    func navigateToPostCreation() {
//        // Instantiate Post Creation VIPER components
//        let postCreationVC = PostCreationViewController()
//        let postCreationRouter = PostCreationRouter()
//        let postCreationInteractor = PostCreationInteractor()
//        let postCreationPresenter = PostCreationPresenter(
//            view: postCreationVC,
//            interactor: postCreationInteractor,
//            router: postCreationRouter
//        )
//
//        // Connect VIPER components
//        postCreationVC.presenter = postCreationPresenter
//        postCreationRouter.viewController = postCreationVC
//
//        // Navigate to Post Creation screen
//        viewController?.navigationController?.pushViewController(postCreationVC, animated: true)
//    }
//}

final class PostRouter: PostRouterProtocol {
    weak var viewController: UIViewController?
    private let postInteractor: PostInteractorProtocol
    
    // Inject PostInteractor during router initialization
    init(postInteractor: PostInteractorProtocol) {
        self.postInteractor = postInteractor
    }
    
    func navigateToPostCreation() {
        // Instantiate Post Creation VIPER components
        let postCreationVC = PostCreationViewController()
        let postCreationRouter = PostCreationRouter()
        let postCreationInteractor = PostCreationInteractor()
        let postCreationPresenter = PostCreationPresenter(
            view: postCreationVC,
            interactor: postCreationInteractor,
            router: postCreationRouter,
            postInteractor: postInteractor // Pass the PostInteractor here
        )
        
        // Connect VIPER components
        postCreationVC.presenter = postCreationPresenter
        postCreationRouter.viewController = postCreationVC
        
        // Navigate to Post Creation screen
        viewController?.navigationController?.pushViewController(postCreationVC, animated: true)
    }
}
