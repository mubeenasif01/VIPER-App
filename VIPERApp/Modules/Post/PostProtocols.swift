//
//  PostProtocols.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

protocol PostViewProtocol: AnyObject {
    func reloadData()
    func reloadUsers()
}

protocol PostInteractorProtocol: AnyObject {
    func fetchPosts() -> [Post]
    func fetchUsers() -> [User]
    func addPost(_ post: Post)
    func switchUser(to user: User)
    func currentUser() -> User
}


protocol PostPresenterProtocol: AnyObject {
    var posts: [Post] { get }
    var users: [User] { get }
    var currentUser: User { get }
    func fetchPosts()
    func fetchUsers()
    func addPost(text: String, image: UIImage?)
    func switchUser(to user: User)
    func navigateToPostCreation()
}

protocol PostRouterProtocol: AnyObject {
    func navigateToPostCreation()
}
