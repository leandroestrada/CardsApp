//
//  CardCell.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import UIKit

class CardCell: UITableViewCell {
    
    static let reuseIdentifier = "CardCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(cardImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cardImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardImageView.heightAnchor.constraint(equalToConstant: 90),
            cardImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configure(with card: Card) {
        nameLabel.text = "Name: \(card.name)"
        typeLabel.text = "Type: \(card.type)"
        if let imageUrl = card.img, let url = URL(string: imageUrl) {
            downloadImage(from: url)
        }
    }
    
    private func downloadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.cardImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
