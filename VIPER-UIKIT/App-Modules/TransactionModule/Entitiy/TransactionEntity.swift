//
//  TransactionEntity.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation

protocol TransactionEntityProtocol{
    var id : UUID {get}
    
    var title : String  {get}
    
    var description : String?  {get}
    
    var value : Double  {get}
}

struct TransactionEntity : Codable{
    var id : UUID
    
    var title : String
    
    var description: String?
    
    var value: Double
  
}

extension TransactionEntity : TransactionEntityProtocol{
    
}
