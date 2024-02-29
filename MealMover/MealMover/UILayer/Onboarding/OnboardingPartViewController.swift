//
//  OnboardingPartViewController.swift
//  MealMover
//
//  Created by Roman Litvinovich on 22/02/2024.
//

import UIKit

// MARK: - OnboardingPartViewController
class OnboardingPartViewController: UIViewController {
    
    // MARK: - Properties
    var imageToShow: UIImage?     { didSet { imageView.image = imageToShow } }
    var titleText: String?        { didSet { titleLabe.text = titleText } }
    var descriptionText: String?  { didSet { descriptionLabel.text = descriptionText } }
    var buttonText: String?

    // MARK: - Views
    private let imageView = UIImageView()
    private let titleLabe = UILabel()
    private let descriptionLabel = UILabel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Layout
private extension OnboardingPartViewController {
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitle()
        setupDescription()
    }
    
    func setupView() {
        view.backgroundColor = .accentOrange
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func setupTitle() {
        view.addSubview(titleLabe)
        titleLabe.translatesAutoresizingMaskIntoConstraints = false
        titleLabe.font = UIFont.Roboto.bold.size(of: 24)
        titleLabe.textColor = .appWhite
        titleLabe.textAlignment = .center
        titleLabe.numberOfLines = 0

        NSLayoutConstraint.activate([
            titleLabe.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.Roboto.regular.size(of: 14)
        descriptionLabel.textColor = .appWhite
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabe.bottomAnchor, constant: 23),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
    
   
    
}


