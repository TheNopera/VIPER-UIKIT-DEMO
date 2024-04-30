//
//  TransactionPresenter.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation

protocol TransactionPresenterProtocol : AnyObject{
    var view : TransactionViewProtocol!{get set}
    
    var router : TransactionRouterProtocol {get set}
    
    var interactor : TransactionInteractorProtocol {get set}
    
    var transactionsList: [TransactionEntity] { get set}
    
    func viewDidLoad()
}

class TransactionPresenter{
    weak var view : TransactionViewProtocol!
    
    var router : TransactionRouterProtocol
    
    var interactor: TransactionInteractorProtocol
    
    var transactionsList: [TransactionEntity]
    
    init(view: TransactionViewProtocol, router: TransactionRouterProtocol, interactor: TransactionInteractorProtocol) {
        self.transactionsList = []
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.viewDidLoad()
    }
}


extension TransactionPresenter : TransactionPresenterProtocol{
    
    //Fetches transactions and reloads the Table
    func viewDidLoad() {
        let transactions = interactor.fecthTransactions()
        transactionsList = transactions
        view?.reloadTableData()
    }
    
    
    
}

