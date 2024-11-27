//
//  PostInteractor.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

final class PostInteractor: PostInteractorProtocol {
    // MARK: - Properties
    private var dataManager = GlobalDataManager.shared

    // MARK: - Methods
    func fetchPosts() -> [Post] {
        return dataManager.fetchPosts(for: nil) // Fetch all posts
    }
    
    func fetchUsers() -> [User] {
        return dataManager.fetchUsers()
    }
    
    func addPost(_ post: Post) {
        dataManager.addPost(post)
    }
    
    func switchUser(to user: User) {
        dataManager.switchUser(to: user)
    }
    
    func currentUser() -> User {
        guard let user = dataManager.currentUser() else {
            fatalError("No user is currently selected.")
        }
        return user
    }
}
