//
//  OnboardingCoordinator.swift
//  MealMover
//
//  Created by Roman Litvinovich on 21/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    override func start() {
        showOnboarding()
    }
    
    override func finish() {}
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .purple
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .brown
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .cyan
        
        let fouthVC = UIViewController()
        fouthVC.view.backgroundColor = .white
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fouthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
