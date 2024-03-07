//
//  OnboardingCoordinator.swift
//  MealMover
//
//  Created by Roman Litvinovich on 21/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    private let factory = SceneFactory.self

    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("app coordinator finich")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController =  SceneFactory.makeOnboardingScene(with: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
