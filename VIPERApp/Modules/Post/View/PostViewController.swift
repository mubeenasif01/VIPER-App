//
//  PostViewController.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import UIKit

class PostViewController: UIViewController, PostViewProtocol {
    
    var presenter: PostPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(presenter != nil, "Presenter is nil. Ensure VIPER components are correctly connected.")
        setupUI()
        presenter.fetchPosts()
        presenter.fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fetch the latest posts and reload the table view
        presenter.fetchPosts()
        tableView.reloadData()
    }
    
    func setupUI() {
        title = "Posts"
        view.backgroundColor = .white
        
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupLeftBarButton()
        setupRightBarButton()
    }
    
    @objc func createPostTapped() {
        presenter.navigateToPostCreation()
    }
    
    func setupLeftBarButton() {
        // Create a left bar button item
        let createPostButton = UIBarButtonItem(
            title: "Create Post",
            style: .plain,
            target: self,
            action: #selector(createPostTapped)
        )
        navigationItem.leftBarButtonItem = createPostButton
    }
    
    func setupRightBarButton() {
        guard let users = presenter?.users else {
            print("No users available")
            return
        }
        
        let currentUser = presenter.currentUser // Get the currently selected user
        
        // Create actions dynamically for each user
        var userActions: [UIAction] = []
        
        for user in users {
            let action = UIAction(
                title: user.name,
                image: UIImage(systemName: "person.circle"),
                state: user.id == currentUser.id ? .on : .off // Add tick mark for selected user
            ) { _ in
                print("\(user.name) selected")
                self.presenter.switchUser(to: user)
                self.presenter.fetchPosts()
                self.setupRightBarButton()
            }
            userActions.append(action)
        }
        
        // Create the menu
        let menu = UIMenu(title: "Change User", children: userActions)
        
        // Add the menu to the right bar button item
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(systemName: "ellipsis.circle"), primaryAction: nil, menu: menu)
        navigationItem.rightBarButtonItem = menuButton
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func reloadUsers(){
        setupRightBarButton()
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
            fatalError("Unable to dequeue PostTableViewCell")
        }
        let post = presenter.posts[indexPath.row]
        cell.nameLabel.text = "\(post.user.name) \(post.user.username)"
        cell.descriptionLabel.text = post.text
        cell.userImageView.image = post.user.profileImage
        cell.imageVIew.image = post.image
        
        return cell
    }
}
