//
//  TransactionInteractor.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation

protocol TransactionInteractorProtocol{
    var presenter : TransactionPresenterProtocol? {get set}
    func fecthTransactions() -> [TransactionEntity]
}

class TransactionInteractor{
    weak var presenter : TransactionPresenterProtocol?
    
}

extension TransactionInteractor : TransactionInteractorProtocol{
    func fecthTransactions() -> [TransactionEntity] {
        return [TransactionEntity(id: UUID(), title: "test1", value: 2),
                TransactionEntity(id: UUID(), title: "test2", value: 5),
                TransactionEntity(id: UUID(), title: "test3", value: 1)]
    }
}
