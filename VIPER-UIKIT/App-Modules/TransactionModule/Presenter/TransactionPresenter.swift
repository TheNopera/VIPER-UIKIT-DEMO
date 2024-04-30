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
    
    //An array to keep our Transactions
    var transactionsList: [TransactionEntity] { get set}
    
    //Function to get all transactions and put on the list
    func getTransactions()
    
    //Open transaction details
    func openDetails(fromID : UUID)
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
        
        self.getTransactions()
    }
}


extension TransactionPresenter : TransactionPresenterProtocol{
  
    //Fetches transactions and reloads the Table
    func getTransactions() {
        let transactions = interactor.fecthTransactions()
        transactionsList = transactions
        view?.reloadTableData()
    }
    
    func openDetails(fromID : UUID){
        guard let transaction = transactionsList.first(where: { $0.id == fromID }) else {
               // If no transaction is found, handle the error gracefully
               print("Transaction with ID \(fromID) not found")
               return
        }
        router.routeFor(transaction: transaction)
    }
    
    
}

