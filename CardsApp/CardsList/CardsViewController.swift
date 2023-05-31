//
//  ViewController.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import UIKit

class CardsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CardsViewModelDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CardCell.self, forCellReuseIdentifier: CardCell.reuseIdentifier)
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private var viewModel: CardsViewModel
    
    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.delegate = self
        spinner.startAnimating()
        viewModel.fetchCards()
    }
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.reuseIdentifier, for: indexPath) as? CardCell else {
            return UITableViewCell()
        }
        
        let card = viewModel.cards[indexPath.row]
        cell.configure(with: card)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let card = viewModel.cards[indexPath.row]
        let cardDetailViewModel = CardDetailViewModel(card: card)
        let cardDetailViewController = CardDetailViewController(viewModel: cardDetailViewModel)
        navigationController?.pushViewController(cardDetailViewController, animated: true)
    }
    
    func cardsLoaded() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func cardsLoadFailed(with error: Error) {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
}

extension CardsViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
