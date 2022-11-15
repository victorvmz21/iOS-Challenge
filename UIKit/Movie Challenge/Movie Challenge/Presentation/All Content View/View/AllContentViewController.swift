//
//  AllContentViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class AllContentViewController: UIViewController {
    
    var allContentView: AllContentView {
        guard let unwrappedView = self.view as? AllContentView else {
            fatalError("No View!")
        }
        return unwrappedView
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AllContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
