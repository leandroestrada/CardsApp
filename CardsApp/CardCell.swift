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
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 4.0
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
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: -16),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            cardImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardImageView.heightAnchor.constraint(equalToConstant: 70),
            cardImageView.widthAnchor.constraint(equalToConstant: 70)
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
