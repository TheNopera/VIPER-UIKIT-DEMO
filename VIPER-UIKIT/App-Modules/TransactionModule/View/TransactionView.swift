//
//  TransactionView.swift
//  VIPER-UIKIT
//
//  Created by Daniel Ishida on 29/04/24.
//

import Foundation
import UIKit

protocol TransactionViewProtocol : AnyObject{
    var presenter : TransactionPresenterProtocol? { get set }
    
    func reloadTableData()
}

class TransactionView : UIViewController{
    var tableView = UITableView()
    
    var presenter : TransactionPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        self.setupTableView()
        
    }
    
    //MARK: SETUP THE LIST (TABLE VIEW)
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier:"TransactionCell" )
        view.addSubview(tableView)
        
        // Enable Auto Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: TABLE DELEGATE AND DATA SOURCE
extension TransactionView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.transactionsList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        
        // Configure cell with data from presenter or other source
        var content = cell.defaultContentConfiguration()
        //Gets Transactions
        content.text = presenter?.transactionsList[indexPath.row].title
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewDidLoad()
    }
    
}

//MARK: IMPLENTATION OF VIEW PROTOCOL
extension TransactionView : TransactionViewProtocol{
    func reloadTableData() {
        tableView.reloadData()
        print("reloaded")
    }
}
