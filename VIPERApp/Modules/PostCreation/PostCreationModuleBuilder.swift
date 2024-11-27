//
//  PostCreationModuleBuilder.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

final class PostCreationModuleBuilder {
    static func build(postInteractor: PostInteractorProtocol) -> UIViewController {
        let view = PostCreationViewController()
        let interactor = PostCreationInteractor()
        let router = PostCreationRouter()
        let presenter = PostCreationPresenter(view: view, interactor: interactor, router: router, postInteractor: postInteractor)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
