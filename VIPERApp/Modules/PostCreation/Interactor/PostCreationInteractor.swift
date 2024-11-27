//
//  PostCreationInteractor.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import Foundation
import UIKit

class PostCreationInteractor: PostCreationInteractorProtocol {
    func validatePost(text: String, image: UIImage?) -> Bool {
        return !text.isEmpty || image != nil
    }
}
