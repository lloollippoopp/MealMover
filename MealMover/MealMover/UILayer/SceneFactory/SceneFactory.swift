//
//  SceneFactory.swift
//  MealMover
//
//  Created by Roman Litvinovich on 07/03/2024.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding,
                                                          navigationController: navigationController,
                                                          finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(with coordinator: OnboardingCoordinator) -> OnboardingViewController {
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
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    //MARK: -Main flow
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home",
                                                           image: UIImage.init(resource: .home),
                                                           tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order",
                                                            image: UIImage.init(resource: .order),
                                                           tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List",
                                                           image: UIImage.init(resource: .list),
                                                           tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile",
                                                              image: UIImage.init(resource: .profile),
                                                           tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController,
                                 orderNavigationController,
                                 listNavigationController,
                                 profileNavigationController]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
        
    }
}
