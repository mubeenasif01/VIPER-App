//
//  PostCreationPresenter.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

class PostCreationPresenter: PostCreationPresenterProtocol {
    private weak var view: PostCreationViewProtocol?
    private let interactor: PostCreationInteractorProtocol
    private let router: PostCreationRouterProtocol
    private let postInteractor: PostInteractorProtocol // To add the post to the post list.
    
    init(view: PostCreationViewProtocol, interactor: PostCreationInteractorProtocol, router: PostCreationRouterProtocol, postInteractor: PostInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.postInteractor = postInteractor
    }
    
    func submitPost(text: String, image: UIImage?) {
        if interactor.validatePost(text: text, image: image) {
            // Create a new post and add it to the list.
            let user = postInteractor.currentUser()
            let post = Post(user: user, text: text, image: image)
            postInteractor.addPost(post)
            
            // Clear inputs and navigate back.
            view?.clearInputs()
            router.navigateBackToPostList()
        } else {
            view?.displayErrorMessage("Post must have text or an image.")
        }
    }
}
