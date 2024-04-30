//
//  TransactionDetailView.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 30/04/24.
//

import Foundation
import UIKit

protocol TransactionDetailViewProtocol{
    
}

class TransactionDetailView : UIViewController{
    // Properties to display transaction details
    var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var valueLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    var descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    // Transaction data
    var transaction: TransactionEntity
    
    init(transaction: TransactionEntity) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        populateData()
    }
    
    // Setup UI elements
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(valueLabel)
        view.addSubview(descriptionLabel)
        
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Center titleLabel vertically and horizontally
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            // Center valueLabel vertically and horizontally
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Center descriptionLabel vertically and horizontally
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
    }
    
    // Populate data from transaction object
    private func populateData() {
        titleLabel.text = transaction.title
        valueLabel.text = "\(transaction.value)"
        descriptionLabel.text = transaction.description ?? "-/-"
    }
}

extension TransactionDetailView : TransactionDetailViewProtocol{
    
}
