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
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [OnboardingPartViewController]()
        let onboardingScrensText: String = "Next"
        let lastScreenOnboardingText: String = "Let's start"
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow =  UIImage(resource: .first)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = onboardingScrensText
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow =  UIImage(resource: .second)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = onboardingScrensText
        
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow =  UIImage(resource: .third)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = onboardingScrensText


        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow =  UIImage(resource: .fourth)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.buttonText = lastScreenOnboardingText


        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
