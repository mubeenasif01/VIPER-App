//
//  PostCreationProtocols.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit
protocol PostCreationViewProtocol: AnyObject {
    func displayErrorMessage(_ message: String)
    func clearInputs()
}

protocol PostCreationInteractorProtocol: AnyObject {
    func validatePost(text: String, image: UIImage?) -> Bool
}

protocol PostCreationPresenterProtocol: AnyObject {
    func submitPost(text: String, image: UIImage?)
}

protocol PostCreationRouterProtocol: AnyObject {
    func navigateBackToPostList()
}
