//
//  TransactionRouter.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation

protocol TransactionRouterProtocol{
    func buildView() -> TransactionView
}

class TransactionRouter{
    
}

extension TransactionRouter : TransactionRouterProtocol{
    func buildView() -> TransactionView {
        let view = TransactionView()
        let interactor = TransactionInteractor()
        let presenter = TransactionPresenter(view: view, router: self, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
  
}
