//
//  PostPresenter.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

final class PostPresenter: PostPresenterProtocol {
    private let interactor: PostInteractorProtocol
    private weak var view: PostViewProtocol?
    private let router: PostRouterProtocol
    
    var posts: [Post] = []
    
    var users: [User] = []
    
    var currentUser: User {
        return interactor.currentUser()
    }
    
    init(interactor: PostInteractorProtocol, view: PostViewProtocol, router: PostRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func fetchPosts() {
        posts = interactor.fetchPosts()
        view?.reloadData()
    }
    
    func fetchUsers() {
        users = interactor.fetchUsers()
        view?.reloadUsers()
    }
    
    func addPost(text: String, image: UIImage?) {
        let newPost = Post(user: currentUser, text: text, image: image)
        interactor.addPost(newPost)
        fetchPosts()
    }
    
    func switchUser(to user: User) {
        interactor.switchUser(to: user)
        fetchPosts()
    }
    
    func navigateToPostCreation() {
        router.navigateToPostCreation()
    }
}


