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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardSetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let attackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let healthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
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
        view.addSubview(attackLabel)
        view.addSubview(healthLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardSetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            cardSetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: cardSetLabel.bottomAnchor, constant: 30),
            typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            attackLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 30),
            attackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            healthLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 30),
            healthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func populateData() {
        nameLabel.text = viewModel.name
        cardSetLabel.text = "Set: \(viewModel.cardSet)"
        typeLabel.text = "Type: \(viewModel.type)"
        attackLabel.text = "Attack: \(viewModel.attack ?? 0)"
        healthLabel.text = "Health: \(viewModel.health ?? 0)"
    }
}
