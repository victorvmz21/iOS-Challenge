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
}

