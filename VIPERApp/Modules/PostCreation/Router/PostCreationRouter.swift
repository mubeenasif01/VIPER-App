//
//  PostCreationRouter.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

class PostCreationRouter: PostCreationRouterProtocol {
    weak var viewController: UIViewController?
    
    func navigateBackToPostList() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
