//
//  CardDetailViewController.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    private let viewModel: CardDetailViewModel

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardSetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(viewModel: CardDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        populateData()
    }

    private func setupViews() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(nameLabel)
        view.addSubview(cardSetLabel)
        view.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cardSetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            cardSetLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            cardSetLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: cardSetLabel.bottomAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }

    private func populateData() {
        nameLabel.text = viewModel.name
        cardSetLabel.text = viewModel.cardSet
        typeLabel.text = viewModel.type
    }
}
