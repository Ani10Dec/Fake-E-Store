//
//  ProductViewController.swift
//  Fake E Store
//
//  Created by Aniket Kumar on 11/02/24.
//

import UIKit

class ProductViewController: UIViewController {
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        observeEvent()
    }
    
    private func initViewModel() {
        viewModel.fetchProucts()
    }
    
    private func observeEvent() {
        viewModel.dataBindingHanler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading: break
            case .loadingComplete: break
            case .loaded: print(self.viewModel.product)
            case .message(let error):
                print(error)
            }
            
        }
    }

}
