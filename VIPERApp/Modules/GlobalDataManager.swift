//
//  GlobalDataManager.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 27/11/2024.
//

import Foundation
import UIKit

final class GlobalDataManager {
    // MARK: - Singleton Instance
    static let shared = GlobalDataManager()
    
    // MARK: - Properties
    private(set) var users: [User] = []
    private(set) var posts: [Post] = []
    
    private var selectedUser: User?
    
    // MARK: - Initializer
    private init() {
        setupDummyData()
    }
    
    // MARK: - Dummy Data Setup
    private func setupDummyData() {
        // Create Dummy Users
        let user1 = User(id: "1", name: "John Doe", username: "@johndoe", profileImage: UIImage(systemName: "person.fill")!)
        let user2 = User(id: "2", name: "Jane Smith", username: "@janesmith", profileImage: UIImage(systemName: "person.fill")!)
        let user3 = User(id: "3", name: "Alice Johnson", username: "@alicejohnson", profileImage: UIImage(systemName: "person.fill")!)
        
        users = [user1, user2, user3]
        selectedUser = user1
        
        // Create Dummy Posts
        let post1 = Post(user: user1, text: "Hello, world!", image: UIImage(systemName: "photo")!)
        let post2 = Post(user: user2, text: "Swift is amazing!", image: UIImage(systemName: "photo")!)
        let post3 = Post(user: user3, text: "Check out this view!", image: UIImage(systemName: "photo")!)
        
        posts = [post1, post2, post3]
    }
    
    // MARK: - Methods
    func fetchUsers() -> [User] {
        return users
    }
    
    func fetchPosts(for user: User?) -> [Post] {
        guard let user = user else { return posts }
        return posts.filter { $0.user.id == user.id }
    }
    
    func addPost(_ post: Post) {
        posts.insert(post, at: 0)
    }
    
    func switchUser(to user: User) {
        selectedUser = user
    }
    
    func currentUser() -> User? {
        return selectedUser
    }
}
