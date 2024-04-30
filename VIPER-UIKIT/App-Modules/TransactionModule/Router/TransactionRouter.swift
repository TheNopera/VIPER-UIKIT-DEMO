//
//  TransactionRouter.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation
import UIKit

protocol TransactionRouterProtocol{
    //Declare all layers the module needs to be constructed and returns the view
    func buildView() -> TransactionView
    
    func routeFor(transaction : TransactionEntity)
}

class TransactionRouter{
    var view : UINavigationController?
    
    init() {
        let nav = UINavigationController(rootViewController: self.buildView())
        self.view = nav
    }
    
}

extension TransactionRouter : TransactionRouterProtocol{
    func routeFor(transaction : TransactionEntity ) {
        view?.pushViewController(TransactionDetailView(transaction: transaction ), animated: true)
    }
    
   func buildView() -> TransactionView {
        let view = TransactionView()
        let interactor = TransactionInteractor()
        let presenter = TransactionPresenter(view: view, router: self, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
