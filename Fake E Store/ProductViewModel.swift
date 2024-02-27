//
//  ProductViewModel.swift
//  Fake E Store
//
//  Created by Aniket Kumar on 11/02/24.
//

import Foundation


final class ProductViewModel {
    
    var product: [ProductModel] = []
    var dataBindingHanler: ((_ event: Event) -> Void)?
    
    func fetchProucts() {
        dataBindingHanler?(.loading)
        NetworkManager.shared.fetchProductData { response in
            self.dataBindingHanler?(.loadingComplete)
            switch response {
            case .success(let result):
                self.product = result
                self.dataBindingHanler?(.loaded)
            case .failure(let error):
                self.dataBindingHanler?(.message(error.localizedDescription as? Error))
            }
        }
    }
}


extension ProductViewModel {
    enum Event {
        case loading
        case loadingComplete
        case loaded
        case message(Error?)
    }
}
