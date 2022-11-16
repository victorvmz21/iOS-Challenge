//
//  UIViewControllerExtension.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

extension UIViewController {
    
    func displayErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let dismisButtonAction = UIAlertAction(title: "Dismiss", style: .default)
        
        alert.addAction(dismisButtonAction)
        self.present(alert, animated: true)
    }
    
    func startLoadingAnimation() {
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .large
        loadingIndicator.tintColor = .gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func stopLoadingAnimation() {
        dismiss(animated: false, completion: nil)
    }
}

