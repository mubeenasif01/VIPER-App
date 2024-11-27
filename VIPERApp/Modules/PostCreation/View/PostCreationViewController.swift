//
//  PostCreationViewController.swift
//  VIPERApp
//
//  Created by Mubeen Asif on 26/11/2024.
//

import UIKit

import UIKit

class PostCreationViewController: UIViewController {
    var presenter: PostCreationPresenterProtocol!
    
    private let postTextField = UITextField()
    private let postImageView = UIImageView()
    private let selectImageButton = UIButton(type: .system)
    private let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Create Post"
        
        // TextField
        postTextField.placeholder = "Enter post text"
        postTextField.borderStyle = .roundedRect
        view.addSubview(postTextField)
        
        // ImageView
        postImageView.contentMode = .scaleAspectFit
        postImageView.layer.borderWidth = 1
        postImageView.layer.borderColor = UIColor.lightGray.cgColor
        postImageView.layer.cornerRadius = 8
        postImageView.clipsToBounds = true
        view.addSubview(postImageView)
        
        // Select Image Button
        selectImageButton.setTitle("Select Image", for: .normal)
        selectImageButton.addTarget(self, action: #selector(selectImageTapped), for: .touchUpInside)
        view.addSubview(selectImageButton)
        
        // Submit Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        
        // Layout
        postTextField.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        postImageView.frame = CGRect(x: 20, y: 160, width: view.frame.width - 40, height: 200)
        selectImageButton.frame = CGRect(x: 20, y: 380, width: view.frame.width - 40, height: 40)
        submitButton.frame = CGRect(x: 20, y: 440, width: view.frame.width - 40, height: 40)
    }
    
    @objc private func selectImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func submitTapped() {
        let text = postTextField.text ?? ""
        let image = postImageView.image
        presenter.submitPost(text: text, image: image)
    }
}

extension PostCreationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            postImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension PostCreationViewController: PostCreationViewProtocol {
    func displayErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func clearInputs() {
        postTextField.text = ""
        postImageView.image = nil
    }
}
